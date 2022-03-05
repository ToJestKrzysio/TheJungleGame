import itertools
from typing import Tuple
from unittest.mock import Mock, call, MagicMock

import pytest
import numpy as np

from src.game import moves
from src.game import board as game_board
from src.game.cell import Cell
from src.game.exceptions import MoveNotPossibleError
from src.game.unit import Empty, Tiger
from src.game.unit import *


class TestBoard:

    def test_new(self, empty_cells_array):
        board = game_board.Board(empty_cells_array)

        assert isinstance(board, game_board.Board)
        assert board.shape == empty_cells_array.shape
        assert np.array_equal(board, empty_cells_array)
        assert not board.positions

    @pytest.mark.parametrize("position", [(9, 7), (2, 3), (0, 0)])
    @pytest.mark.parametrize("unit", [
        unit(white) for unit in Unit.__subclasses__()
        for white in (True, False) if not issubclass(unit, Empty)
    ])
    def test_get_positions(self, empty_cells_array, position, unit):
        empty_cells_array[position].occupant = unit
        board = game_board.Board(empty_cells_array)

        positions = board.get_positions()

        assert len(positions) == 1
        assert positions[unit] == position

    @pytest.mark.parametrize("positions", [
        {"Lion": (0, 0), "Dog": (1, 1), "Mouse": (2, 0)},
        {"Den": (0, 3), "Dog": (1, 6)},
        dict(),
    ])
    def test_get_moves_for_all_units(self, positions):
        board_mock = Mock(positions=positions)
        board_mock.get_single_unit_moves.return_value = {
            (0, 0), (1, 1), (2, 2), (3, 3)
        }

        result = game_board.Board.get_moves_for_all_units(board_mock)

        expected_calls = [call(position) for position in positions.values()]
        board_mock.get_single_unit_moves.assert_has_calls(expected_calls)
        assert isinstance(result, dict)

    @pytest.mark.parametrize("position", [
        game_board.Position(y=1, x=1),
        game_board.Position(y=0, x=0),
        game_board.Position(y=9, x=7),
        game_board.Position(y=19, x=19),
    ])
    def test_get_single_unit_moves(self, position: game_board.Position):
        board_mock = Mock()
        board_mock._process_move.return_value = (True, moves.invalid_move)

        result = game_board.Board.get_single_unit_moves(board_mock, position)

        expected_calls = [
            call(position, moves.backward),
            call(position, moves.forward),
            call(position, moves.left),
            call(position, moves.right),
        ]
        board_mock._find_move_position.has_calls(expected_calls)
        assert isinstance(result, set)

    @pytest.mark.parametrize("position, expected", [
        (game_board.Position(y=10, x=3), False),
        (game_board.Position(y=-1, x=6), False),
        (game_board.Position(y=0, x=6), True),
        (game_board.Position(y=0, x=8), False)
    ])
    def test_is_position_valid(self, position, expected):
        double = Mock(shape=(9, 7))

        result = game_board.Board._is_position_valid(double, position)

        assert result == expected

    @pytest.mark.parametrize("position, move, expected", [
        (
                game_board.Position(y=0, x=0),
                moves.Move(value=0, y=1, x=-1, sign=1),
                game_board.Position(y=1, x=-1)
        ),
        (
                game_board.Position(y=6, x=3),
                moves.Move(value=0, y=2, x=-3, sign=1),
                game_board.Position(y=8, x=0)
        ),
        (
                game_board.Position(y=7, x=-7),
                moves.Move(value=0, y=-7, x=7, sign=1),
                game_board.Position(y=0, x=0)
        )
    ])
    def test_get_new_position(self, position, move, expected):
        result = game_board.Board._get_new_position(position, move)
        assert result == expected

    def test_process_move_invalid_position(self):
        move = moves.Move(value=0, y=1, x=0, sign=1)
        position = game_board.Position(y=3, x=1)
        board_mock = MagicMock(spec=game_board.Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=False, occupant=Tiger(False)),
        ]
        board_mock._get_new_position.side_effect = (game_board.Position(y=4, x=1),)
        board_mock._is_position_valid.return_value = False

        result = game_board.Board._process_move(board_mock, position, move)

        board_mock._get_new_position.assest_called_once_with(
            (1, 1), (1, 0)
        )
        board_mock._is_position_valid.assest_called_once_with(game_board.Position(y=4, x=1))
        assert result == (False, moves.invalid_move)

    @pytest.mark.parametrize("position, move, new_position", [
        (
                game_board.Position(y=2, x=2),
                moves.Move(value=0, y=1, x=0, sign=1),
                game_board.Position(y=3, x=2)),
        (
                game_board.Position(y=2, x=2),
                moves.Move(value=0, y=-1, x=0, sign=1),
                game_board.Position(y=1, x=2)),
        (
                game_board.Position(y=2, x=2),
                moves.Move(value=0, y=0, x=1, sign=1),
                game_board.Position(y=2, x=3)),
        (
                game_board.Position(y=2, x=2),
                moves.Move(value=0, y=0, x=-1, sign=1),
                game_board.Position(y=2, x=1)),
    ])
    def test_process_move_jumps_no_water(
            self,
            position,
            move,
            new_position
    ):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=True),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position.return_value = new_position

        result = game_board.Board._process_move(board_mock, position, move)

        board_mock._get_new_position.assert_called_once_with(
            position, move
        ),
        board_mock._is_position_valid.assert_called_once_with(new_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (True, move)

    @pytest.mark.parametrize("position, move, next_position", [
        (
                game_board.Position(y=2, x=2),
                moves.Move(value=0, y=1, x=0, sign=1),
                game_board.Position(y=3, x=2)
        ),
        (
                game_board.Position(y=6, x=4),
                moves.Move(value=0, y=-1, x=0, sign=1),
                game_board.Position(y=5, x=4)
        ),
        (
                game_board.Position(y=4, x=0),
                moves.Move(value=0, y=0, x=1, sign=1),
                game_board.Position(y=4, x=1)
        ),
        (
                game_board.Position(y=6, x=6),
                moves.Move(value=0, y=0, x=-1, sign=1),
                game_board.Position(y=6, x=5)
        ),
    ])
    def test_process_move_cant_jump_over_water(
            self,
            position,
            move,
            next_position
    ):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=False),
            can_capture=Mock(return_value=False)
        )
        new_cell = Mock(water=True)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = game_board.Board._process_move(board_mock, position, move)

        board_mock._get_new_position.assert_called_once_with(position,
                                                             move)
        board_mock._is_position_valid.assest_called_once_with(next_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (False, moves.invalid_move)

    def test_process_move_can_capture_other_on_land(self):
        """
        Tests if given unit can capture other one occupying land cell.
        """
        position = game_board.Position(y=1, x=1)
        move = moves.Move(value=0, y=1, x=0, sign=1)
        next_position = game_board.Position(y=2, x=1)
        old_cell = Mock(
            water=False,
            occupant=Mock(),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = game_board.Board._process_move(board_mock, position, move)

        board_mock._get_new_position.assert_called_once_with(position, move)
        board_mock._is_position_valid.assert_called_once_with(next_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (True, move)

    @pytest.mark.parametrize("items, expected", [
        [(), 0],
        [(None, None, None, None, None, None), 0],
        [(1, 2, 3, 3, 3, 3, None, None, None, None, None, None), 4],
    ])
    def test_get_repetition(self, items, expected):
        result = game_board.Board._get_repetition(items)

        assert result == expected

    def test_get_repetitions(self):
        player, opponent = Mock(), Mock()
        board_mock = Mock(last_moves=[player, opponent])
        game_board.Board.get_repetitions(self=board_mock)

        board_mock._get_repetition.assert_has_calls([call(player),
                                                     call(opponent)])

    @pytest.mark.parametrize("new_position", [
        game_board.Position(y=2, x=3),
        game_board.Position(y=0, x=0),
        game_board.Position(y=7, x=7),
    ])
    @pytest.mark.parametrize("move", [
        moves.forward_jump, moves.backward_jump, moves.left_jump, moves.right_jump
    ])
    @pytest.mark.parametrize("occupied", [0, 1])
    def test_validate_jump_moves_cells_occupied(self, new_position, move, occupied):
        empty_water_cell = MagicMock(water=True)
        empty_water_cell.__bool__.return_value = False
        occupied_water_cell = MagicMock(water=True)
        empty_water_cell.__bool__.return_value = True

        board_mock = MagicMock()
        cells = [empty_water_cell] * 3
        cells[occupied] = occupied_water_cell
        board_mock.__getitem__.side_effect = cells
        assert game_board.Board.validate_jump_move(board_mock, new_position, move) is False

    @pytest.mark.parametrize("new_position", [
        game_board.Position(y=2, x=3),
        game_board.Position(y=0, x=0),
        game_board.Position(y=7, x=7),
    ])
    @pytest.mark.parametrize("move", [
        moves.forward_jump, moves.backward_jump, moves.left_jump, moves.right_jump
    ])
    def test_validate_jump_moves_all_cells_empty(self, new_position: game_board.Position, move):
        empty_water_cell = MagicMock(water=True)
        empty_water_cell.__bool__.return_value = False
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [empty_water_cell, empty_water_cell, empty_water_cell]

        assert game_board.Board.validate_jump_move(board_mock, new_position, move) is True


class TestMove:

    @pytest.mark.parametrize("new_position, unit_position, moves", [
        (
                moves.Move(0, 0, 0, 1), (-1, -1),
                {
                    moves.Move(0, 0, -1, 1), moves.Move(0, -1, 0, 1),
                    moves.Move(0, -2, -1, 1), moves.Move(0, -1, -2, 1)
                }
        ),
        (
                moves.Move(0, -1, -1, 1), (-1, -1),
                {
                    moves.Move(0, 0, -1, 1), moves.Move(0, -1, 0, 1),
                    moves.Move(0, -2, -1, 1), moves.Move(0, -1, -2, 1)
                }
        ),
        (
                moves.Move(0, 123, 98, 1), (341, 0),
                {
                    moves.Move(0, 123, 99, 1), moves.Move(0, 123, 97, 1),
                    moves.Move(0, 122, 98, 1), moves.Move(0, 124, 98, 1)
                }
        ),
    ])
    def test__move__impossible_move(self, new_position, unit_position, moves):
        """
        If new position is not a valid position for selected unit, MoveNotPossibleError should
        be raised.
        """
        occupant_mock = Mock()
        board_state = MagicMock()
        board_state.__getitem__.return_value = Mock(occupant=occupant_mock)
        board_state.moves = {occupant_mock: moves}

        with pytest.raises(MoveNotPossibleError):
            game_board.Board.move(board_state, unit_position, new_position)

    # @pytest.mark.parametrize("unit_position, new_position, move", [
    #     [
    #         game_board.Position(y=0, x=0),
    #         game_board.Position(y=1, x=0),
    #         moves.forward
    #     ],
    #     [
    #         game_board.Position(y=0, x=0),
    #         game_board.Position(y=0, x=1),
    #         moves.right
    #     ],
    #     [
    #         game_board.Position(y=1, x=0),
    #         game_board.Position(y=0, x=0),
    #         moves.backward
    #     ],
    #     [
    #         game_board.Position(y=1, x=1),
    #         game_board.Position(y=1, x=0),
    #         moves.left
    #     ],
    #     [
    #         game_board.Position(y=1, x=0),
    #         game_board.Position(y=2, x=0),
    #         moves.forward
    #     ],
    #     [
    #         game_board.Position(y=2, x=0),
    #         game_board.Position(y=2, x=1),
    #         moves.right
    #     ],
    #     [
    #         game_board.Position(y=2, x=0),
    #         game_board.Position(y=1, x=0),
    #         moves.backward
    #     ],
    #
    #     [
    #         game_board.Position(y=0, x=1),
    #         game_board.Position(y=0, x=0),
    #         moves.left
    #     ],
    #     [
    #         game_board.Position(y=0, x=1),
    #         game_board.Position(y=0, x=2),
    #         moves.Move(value=0, y=0, x=1, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=0, x=1),
    #         game_board.Position(y=1, x=1),
    #         moves.Move(value=0, y=1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=1),
    #         game_board.Position(y=0, x=1),
    #         moves.Move(value=0, y=-1, x=0, sign=-1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=1),
    #         game_board.Position(y=1, x=0),
    #         moves.Move(value=0, y=0, x=-1, sign=-1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=1),
    #         game_board.Position(y=1, x=2),
    #         moves.Move(value=0, y=0, x=1, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=1),
    #         game_board.Position(y=2, x=1),
    #         moves.Move(value=0, y=1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=2, x=1),
    #         game_board.Position(y=2, x=0),
    #         moves.Move(value=0, y=0, x=-1, sign=-1)
    #     ],
    #     [
    #         game_board.Position(y=2, x=1),
    #         game_board.Position(y=1, x=1),
    #         moves.Move(value=0, y=-1, x=0, sign=-1)
    #     ],
    #     [
    #         game_board.Position(y=2, x=1),
    #         game_board.Position(y=2, x=2),
    #         moves.Move(value=0, y=0, x=1, sign=1)
    #     ],
    #
    #     [
    #         game_board.Position(y=0, x=2),
    #         game_board.Position(y=0, x=1),
    #         moves.Move(value=0, y=0, x=-1, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=0, x=2),
    #         game_board.Position(y=1, x=2),
    #         moves.Move(value=0, y=1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=2),
    #         game_board.Position(y=0, x=2),
    #         moves.Move(value=0, y=-1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=2),
    #         game_board.Position(y=1, x=1),
    #         moves.Move(value=0, y=0, x=-1, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=1, x=2),
    #         game_board.Position(y=2, x=2),
    #         moves.Move(value=0, y=1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=2, x=2),
    #         game_board.Position(y=1, x=2),
    #         moves.Move(value=0, y=-1, x=0, sign=1)
    #     ],
    #     [
    #         game_board.Position(y=2, x=2),
    #         game_board.Position(y=2, x=1),
    #         moves.Move(value=0, y=0, x=-1, sign=1)
    #     ],
    # ])
    @pytest.mark.parametrize("unit_position, new_position, move", [
        # starting position (y=0, x=0)
        [
            game_board.Position(y=0, x=0),
            game_board.Position(y=1, x=0),
            moves.forward
        ],
        [
            game_board.Position(y=0, x=0),
            game_board.Position(y=0, x=1),
            moves.right
        ],

        # starting position (y=0, x=1)
        [
            game_board.Position(y=0, x=1),
            game_board.Position(y=1, x=1),
            moves.forward
        ],
        [
            game_board.Position(y=0, x=1),
            game_board.Position(y=0, x=0),
            moves.left
        ],
        [
            game_board.Position(y=0, x=1),
            game_board.Position(y=0, x=2),
            moves.right
        ],

        # starting position (y=0, x=2)
        [
            game_board.Position(y=0, x=2),
            game_board.Position(y=1, x=2),
            moves.forward
        ],
        [
            game_board.Position(y=0, x=2),
            game_board.Position(y=0, x=1),
            moves.left
        ],

        # starting position (y=1, x=0)
        [
            game_board.Position(y=1, x=0),
            game_board.Position(y=0, x=0),
            moves.backward
        ],
        [
            game_board.Position(y=1, x=0),
            game_board.Position(y=2, x=0),
            moves.forward
        ],
        [
            game_board.Position(y=1, x=0),
            game_board.Position(y=1, x=1),
            moves.right
        ],

        # starting position (y=1, x=1)
        [
            game_board.Position(y=1, x=1),
            game_board.Position(y=0, x=1),
            moves.backward
        ],
        [
            game_board.Position(y=1, x=1),
            game_board.Position(y=2, x=1),
            moves.forward
        ],
        [
            game_board.Position(y=1, x=1),
            game_board.Position(y=1, x=0),
            moves.left
        ],
        [
            game_board.Position(y=1, x=1),
            game_board.Position(y=1, x=2),
            moves.right
        ],

        # starting position (y=1, x=2)
        [
            game_board.Position(y=1, x=2),
            game_board.Position(y=0, x=2),
            moves.backward
        ],
        [
            game_board.Position(y=1, x=2),
            game_board.Position(y=2, x=2),
            moves.forward
        ],
        [
            game_board.Position(y=1, x=2),
            game_board.Position(y=1, x=1),
            moves.left
        ],

        # starting position (y=2, x=0)
        [
            game_board.Position(y=2, x=0),
            game_board.Position(y=1, x=0),
            moves.backward
        ],
        [
            game_board.Position(y=2, x=0),
            game_board.Position(y=2, x=1),
            moves.right
        ],

        # starting position (y=2, x=1)
        [
            game_board.Position(y=2, x=1),
            game_board.Position(y=1, x=1),
            moves.backward
        ],
        [
            game_board.Position(y=2, x=1),
            game_board.Position(y=2, x=0),
            moves.left
        ],
        [
            game_board.Position(y=2, x=1),
            game_board.Position(y=2, x=2),
            moves.right
        ],

        # starting position (y=2, x=2)
        [
            game_board.Position(y=2, x=2),
            game_board.Position(y=1, x=2),
            moves.backward
        ],
        [
            game_board.Position(y=2, x=2),
            game_board.Position(y=2, x=1),
            moves.left
        ],
    ])
    @pytest.mark.parametrize("unit", [
        WHITE_MOUSE, WHITE_CAT, WHITE_DOG, WHITE_WOLF, WHITE_LEOPARD,
        WHITE_TIGER, WHITE_LION, WHITE_ELEPHANT, BLACK_MOUSE, BLACK_CAT,
        BLACK_DOG, BLACK_WOLF, BLACK_LEOPARD, BLACK_TIGER, BLACK_LION,
        BLACK_ELEPHANT,
    ])
    def test__move__board_copying(
            self,
            unit_position: game_board.Position,
            new_position: game_board.Position,
            move: moves.Move,
            unit: Unit,
    ):
        """
        If new position is valid, new board should be created.
        New position should be occupied by occupant of old position nad old
        position should be empty.
        """
        board_array = [
            [Cell(), Cell(), Cell()],
            [Cell(), Cell(), Cell()],
            [Cell(), Cell(), Cell()]
        ]
        board_array[unit_position.y][unit_position.x] = Cell(unit)
        old_board = game_board.Board(board_array)
        old_board.white_move = unit.white
        print(old_board.moves)
        print(move)

        new_board = game_board.Board.move(old_board, unit_position, move)

        assert new_board.shape == old_board.shape
        assert (new_board[new_position].occupant
                == old_board[unit_position].occupant)
        assert new_board[unit_position].occupant == EMPTY
        assert new_board[new_position].occupant == unit
        assert new_board.previous_board is old_board
        for idx in set(range(new_board.shape[0])):
            for idy in range(new_board.shape[1]):
                if (idx, idy) in (new_position, unit_position):
                    continue
                assert (new_board[idx, idy].occupant
                        == old_board[idx, idy].occupant)
