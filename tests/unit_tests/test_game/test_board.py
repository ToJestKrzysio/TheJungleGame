from unittest.mock import Mock, call, MagicMock

import pytest
import numpy as np

from src.game import moves
from src.game.board import Position, Board, BoardMove
from src.game.cell import Cell
from src.game.exceptions import MoveNotPossibleError
from src.game.unit import Empty, Tiger
from src.game.unit import *

WHITE_UNITS = [WHITE_DEN, WHITE_MOUSE, WHITE_CAT, WHITE_DOG, WHITE_WOLF, WHITE_LEOPARD,
               WHITE_TIGER, WHITE_LION, WHITE_ELEPHANT]
BLACK_UNITS = [BLACK_DEN, BLACK_MOUSE, BLACK_CAT, BLACK_DOG, BLACK_WOLF, BLACK_LEOPARD,
               BLACK_TIGER, BLACK_LION, BLACK_ELEPHANT, ]
ALL_UNITS = [*WHITE_UNITS, *BLACK_UNITS]
ALL_MOVES = {*moves.base_moves, *moves.jump_moves}


class TestBoard:

    def test_new(self, empty_cells_array):
        board = Board(empty_cells_array)

        assert isinstance(board, Board)
        assert board.shape == empty_cells_array.shape
        assert np.array_equal(board, empty_cells_array)
        assert not board.positions

    @pytest.mark.parametrize("position", [(9, 7), (2, 3), (0, 0)])
    @pytest.mark.parametrize("unit", ALL_UNITS)
    def test_get_positions(self, empty_cells_array, position, unit):
        empty_cells_array[position].occupant = unit
        board = Board(empty_cells_array)

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

        result = Board.get_moves_for_all_units(board_mock)

        expected_calls = [call(position) for position in positions.values()]
        board_mock.get_single_unit_moves.assert_has_calls(expected_calls)
        assert isinstance(result, dict)

    @pytest.mark.parametrize("position", [
        Position(y=1, x=1),
        Position(y=0, x=0),
        Position(y=9, x=7),
        Position(y=19, x=19),
    ])
    def test_get_single_unit_moves(self, position: Position):
        board_mock = Mock()
        board_mock._process_move.return_value = (True, moves.invalid_move)

        result = Board.get_single_unit_moves(board_mock, position)

        expected_calls = [
            call(position, moves.backward),
            call(position, moves.forward),
            call(position, moves.left),
            call(position, moves.right),
        ]
        board_mock._find_move_position.has_calls(expected_calls)
        assert isinstance(result, set)

    @pytest.mark.parametrize("position, expected", [
        (Position(y=10, x=3), False),
        (Position(y=-1, x=6), False),
        (Position(y=0, x=6), True),
        (Position(y=0, x=8), False)
    ])
    def test_is_position_valid(self, position, expected):
        double = Mock(shape=(9, 7))

        result = Board._is_position_valid(double, position)

        assert result == expected

    @pytest.mark.parametrize("position, move, expected", [
        (
                Position(y=0, x=0),
                moves.Move(value=0, y=1, x=-1, sign=1),
                Position(y=1, x=-1)
        ),
        (
                Position(y=6, x=3),
                moves.Move(value=0, y=2, x=-3, sign=1),
                Position(y=8, x=0)
        ),
        (
                Position(y=7, x=-7),
                moves.Move(value=0, y=-7, x=7, sign=1),
                Position(y=0, x=0)
        )
    ])
    def test_get_new_position(self, position, move, expected):
        result = Board.get_new_position(position, move)
        assert result == expected

    def test_process_move_invalid_position(self):
        move = moves.Move(value=0, y=1, x=0, sign=1)
        position = Position(y=3, x=1)
        board_mock = MagicMock(spec=Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=False, occupant=Tiger(False)),
        ]
        board_mock.get_new_position.side_effect = (Position(y=4, x=1),)
        board_mock._is_position_valid.return_value = False

        result = Board._process_move(board_mock, position, move)

        board_mock.get_new_position.assest_called_once_with(
            (1, 1), (1, 0)
        )
        board_mock._is_position_valid.assest_called_once_with(Position(y=4, x=1))
        assert result == (False, moves.invalid_move)

    @pytest.mark.parametrize("position, move, new_position", [
        (
                Position(y=2, x=2),
                moves.Move(value=0, y=1, x=0, sign=1),
                Position(y=3, x=2)),
        (
                Position(y=2, x=2),
                moves.Move(value=0, y=-1, x=0, sign=1),
                Position(y=1, x=2)),
        (
                Position(y=2, x=2),
                moves.Move(value=0, y=0, x=1, sign=1),
                Position(y=2, x=3)),
        (
                Position(y=2, x=2),
                moves.Move(value=0, y=0, x=-1, sign=1),
                Position(y=2, x=1)),
    ])
    def test_process_move_jumps_no_water(self, position, move, new_position):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=True),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock.get_new_position.return_value = new_position

        result = Board._process_move(board_mock, position, move)

        board_mock.get_new_position.assert_called_once_with(
            position, move
        ),
        board_mock._is_position_valid.assert_called_once_with(new_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (True, move)

    @pytest.mark.parametrize("position, move, next_position", [
        (
                Position(y=2, x=2),
                moves.Move(value=0, y=1, x=0, sign=1),
                Position(y=3, x=2)
        ),
        (
                Position(y=6, x=4),
                moves.Move(value=0, y=-1, x=0, sign=1),
                Position(y=5, x=4)
        ),
        (
                Position(y=4, x=0),
                moves.Move(value=0, y=0, x=1, sign=1),
                Position(y=4, x=1)
        ),
        (
                Position(y=6, x=6),
                moves.Move(value=0, y=0, x=-1, sign=1),
                Position(y=6, x=5)
        ),
    ])
    def test_process_move_cant_jump_over_water(self, position, move, next_position):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=False),
            can_capture=Mock(return_value=False)
        )
        new_cell = Mock(water=True)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock.get_new_position.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = Board._process_move(board_mock, position, move)

        board_mock.get_new_position.assert_called_once_with(position,
                                                            move)
        board_mock._is_position_valid.assest_called_once_with(next_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (False, moves.invalid_move)

    def test_process_move_can_capture_other_on_land(self):
        """
        Tests if given unit can capture other one occupying land cell.
        """
        position = Position(y=1, x=1)
        move = moves.Move(value=0, y=1, x=0, sign=1)
        next_position = Position(y=2, x=1)
        old_cell = Mock(
            water=False,
            occupant=Mock(),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock.get_new_position.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = Board._process_move(board_mock, position, move)

        board_mock.get_new_position.assert_called_once_with(position, move)
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
        result = Board._get_repetition(items)

        assert result == expected

    def test_get_repetitions(self):
        player, opponent = Mock(), Mock()
        board_mock = Mock(last_moves=[player, opponent])
        Board.get_repetitions(self=board_mock)

        board_mock._get_repetition.assert_has_calls([call(player),
                                                     call(opponent)])

    @pytest.mark.parametrize("new_position", [
        Position(y=2, x=3),
        Position(y=0, x=0),
        Position(y=7, x=7),
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
        assert Board.validate_jump_move(board_mock, new_position, move) is False

    @pytest.mark.parametrize("new_position", [
        Position(y=2, x=3),
        Position(y=0, x=0),
        Position(y=7, x=7),
    ])
    @pytest.mark.parametrize("move", [
        moves.forward_jump, moves.backward_jump, moves.left_jump, moves.right_jump
    ])
    def test_validate_jump_moves_all_cells_empty(self, new_position: Position, move):
        empty_water_cell = MagicMock(water=True)
        empty_water_cell.__bool__.return_value = False
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [empty_water_cell, empty_water_cell, empty_water_cell]

        assert Board.validate_jump_move(board_mock, new_position, move) is True


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

        with pytest.raises(Exception, match="Selected move is not valid."):
            Board.move(board_state, unit_position, new_position)

    @pytest.mark.parametrize("unit_position, new_position, move", [
        # starting position (y=0, x=0)
        [
            Position(y=0, x=0),
            Position(y=1, x=0),
            moves.forward
        ],
        [
            Position(y=0, x=0),
            Position(y=0, x=1),
            moves.right
        ],

        # starting position (y=0, x=1)
        [
            Position(y=0, x=1),
            Position(y=1, x=1),
            moves.forward
        ],
        [
            Position(y=0, x=1),
            Position(y=0, x=0),
            moves.left
        ],
        [
            Position(y=0, x=1),
            Position(y=0, x=2),
            moves.right
        ],

        # starting position (y=0, x=2)
        [
            Position(y=0, x=2),
            Position(y=1, x=2),
            moves.forward
        ],
        [
            Position(y=0, x=2),
            Position(y=0, x=1),
            moves.left
        ],

        # starting position (y=1, x=0)
        [
            Position(y=1, x=0),
            Position(y=0, x=0),
            moves.backward
        ],
        [
            Position(y=1, x=0),
            Position(y=2, x=0),
            moves.forward
        ],
        [
            Position(y=1, x=0),
            Position(y=1, x=1),
            moves.right
        ],

        # starting position (y=1, x=1)
        [
            Position(y=1, x=1),
            Position(y=0, x=1),
            moves.backward
        ],
        [
            Position(y=1, x=1),
            Position(y=2, x=1),
            moves.forward
        ],
        [
            Position(y=1, x=1),
            Position(y=1, x=0),
            moves.left
        ],
        [
            Position(y=1, x=1),
            Position(y=1, x=2),
            moves.right
        ],

        # starting position (y=1, x=2)
        [
            Position(y=1, x=2),
            Position(y=0, x=2),
            moves.backward
        ],
        [
            Position(y=1, x=2),
            Position(y=2, x=2),
            moves.forward
        ],
        [
            Position(y=1, x=2),
            Position(y=1, x=1),
            moves.left
        ],

        # starting position (y=2, x=0)
        [
            Position(y=2, x=0),
            Position(y=1, x=0),
            moves.backward
        ],
        [
            Position(y=2, x=0),
            Position(y=2, x=1),
            moves.right
        ],

        # starting position (y=2, x=1)
        [
            Position(y=2, x=1),
            Position(y=1, x=1),
            moves.backward
        ],
        [
            Position(y=2, x=1),
            Position(y=2, x=0),
            moves.left
        ],
        [
            Position(y=2, x=1),
            Position(y=2, x=2),
            moves.right
        ],

        # starting position (y=2, x=2)
        [
            Position(y=2, x=2),
            Position(y=1, x=2),
            moves.backward
        ],
        [
            Position(y=2, x=2),
            Position(y=2, x=1),
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
            unit_position: Position,
            new_position: Position,
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
        old_board = Board(board_array)
        old_board.white_move = unit.white

        new_board = Board.move(old_board, unit_position, move)

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

    @pytest.mark.parametrize("moves, expected", [
        ([], True),
        ([set(), set(), set(), set()], True),
        ([{1}, set(), set(), set()], False),
        ([{1, 1}, set(), set(), set()], False),
    ])
    def test_no_valid_moves(self, moves, expected):
        result = Board.no_valid_moves(moves=moves)
        assert result == expected


class TestBoardMove:

    def test__call__validation(self):
        selected_unit_mock = Mock()
        cell_mock = Mock(occupant=selected_unit_mock)

        board_mock = MagicMock()
        board_mock.get_new_position = Mock(return_value=None)
        board_mock.__getitem__.return_value = cell_mock

        board_move_mock = Mock(board=board_mock)

        unit_position = Mock()
        selected_move = Mock()
        BoardMove.__call__(board_move_mock, unit_position, selected_move)

        board_move_mock.validate_move.assert_called_once_with(
            selected_unit=selected_unit_mock, selected_move=selected_move)
        board_move_mock.validate_player_piece.assert_called_once_with(
            selected_unit=selected_unit_mock)

    def test__call__copying(self):
        board_mock = MagicMock()
        new_position_mock = Mock()
        board_mock.get_new_position = Mock(return_value=new_position_mock)

        board_move_mock = Mock(board=board_mock)

        unit_position = Mock()
        selected_move = Mock()
        BoardMove.__call__(board_move_mock, unit_position, selected_move)

        board_move_mock.copy_board.assert_called_once_with(
            unit_position=unit_position, new_position=new_position_mock
        )

    @pytest.mark.parametrize("selected_move", ALL_MOVES)
    @pytest.mark.parametrize("selected_unit", ALL_UNITS)
    def test_validate_move_selected_invalid_move(self, selected_unit, selected_move):
        board_mock = Mock()
        other_moves = ALL_MOVES.copy()
        other_moves.remove(selected_move)
        board_mock.moves = {selected_unit: other_moves}
        board_move_mock = Mock(board=board_mock)

        with pytest.raises(Exception, match="Selected move is not valid."):
            BoardMove.validate_move(board_move_mock, selected_unit, selected_move)

    @pytest.mark.parametrize("selected_move", ALL_MOVES)
    @pytest.mark.parametrize("selected_unit", ALL_UNITS)
    def test_validate_move_selected_valid(self, selected_unit, selected_move):
        board_mock = Mock()
        board_mock.moves = {selected_unit: ALL_MOVES}
        board_move_mock = Mock(board=board_mock)

        BoardMove.validate_move(board_move_mock, selected_unit, selected_move)

    @pytest.mark.parametrize("selected_unit", BLACK_UNITS)
    def test_validate_player_piece_white_turn_selected_black_piece(self, selected_unit):
        board_mock = Mock()
        board_mock.white_move = True
        board_move_mock = Mock(board=board_mock)

        with pytest.raises(Exception, match="Selected black piece during white player's turn."):
            BoardMove.validate_player_piece(board_move_mock, selected_unit)

    @pytest.mark.parametrize("selected_unit", WHITE_UNITS)
    def test_validate_player_piece_white_turn_selected_white_piece(self, selected_unit):
        board_mock = Mock()
        board_mock.white_move = True
        board_move_mock = Mock(board=board_mock)

        BoardMove.validate_player_piece(board_move_mock, selected_unit)

    @pytest.mark.parametrize("selected_unit", WHITE_UNITS)
    def test_validate_player_piece_black_turn_selected_white_piece(self, selected_unit):
        board_mock = Mock()
        board_mock.white_move = False
        board_move_mock = Mock(board=board_mock)

        with pytest.raises(Exception, match="Selected white piece during black player's turn."):
            BoardMove.validate_player_piece(board_move_mock, selected_unit)

    @pytest.mark.parametrize("selected_unit", BLACK_UNITS)
    def test_validate_player_piece_black_turn_selected_black_piece(self, selected_unit):
        board_mock = Mock()
        board_mock.white_move = False
        board_move_mock = Mock(board=board_mock)

        BoardMove.validate_player_piece(board_move_mock, selected_unit)

    def test_remove_captured_unit(self):
        occupant_mock = Mock()
        cell_mock = Mock(occupant=occupant_mock)
        positions_mock = MagicMock()
        moves_mock = MagicMock()
        board_mock = MagicMock(spec=Board, positions=positions_mock, moves=moves_mock)
        board_mock.__getitem__.return_value = cell_mock

        BoardMove.remove_captured_unit(board_mock, Position(0, 0))

        assert cell_mock.occupant is EMPTY
        positions_mock.__delitem__.assert_called_once_with(occupant_mock)
        moves_mock.__delitem__.assert_called_once_with(occupant_mock)

    def test_move_unit(self):
        start_position = Position(0, 0)
        start_occupant_mock = Mock()
        start_cell_mock = Mock(occupant=start_occupant_mock)

        end_position = Position(1, 0)
        end_occupant_mock = Mock()
        end_cell_mock = Mock(occupant=end_occupant_mock)
        board_mock = MagicMock(spec=Board)
        cell_dict = {
            start_position: start_cell_mock,
            end_position: end_cell_mock
        }
        board_mock.__getitem__.side_effect = cell_dict.__getitem__

        BoardMove.move_unit(
            board=board_mock, start_position=start_position, end_position=end_position
        )

        assert start_cell_mock.occupant is EMPTY
        assert end_cell_mock.occupant is start_occupant_mock
