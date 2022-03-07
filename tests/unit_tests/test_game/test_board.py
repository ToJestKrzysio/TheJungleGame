from collections import deque
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

ALL_UNIT_POSITIONS_DICT = {
    BLACK_DEN: Position(0, 3),
    BLACK_MOUSE: Position(2, 0),
    BLACK_CAT: Position(1, 5),
    BLACK_DOG: Position(1, 1),
    BLACK_WOLF: Position(2, 4),
    BLACK_LEOPARD: Position(2, 2),
    BLACK_TIGER: Position(0, 6),
    BLACK_LION: Position(0, 0),
    BLACK_ELEPHANT: Position(2, 6),
    WHITE_DEN: Position(8, 3),
    WHITE_MOUSE: Position(6, 6),
    WHITE_CAT: Position(7, 1),
    WHITE_DOG: Position(7, 5),
    WHITE_WOLF: Position(6, 2),
    WHITE_LEOPARD: Position(6, 4),
    WHITE_TIGER: Position(8, 0),
    WHITE_LION: Position(8, 6),
    WHITE_ELEPHANT: Position(6, 0),
}
EDGE_POSITIONS = [
    Position(0, 0), Position(0, 6), Position(8, 0), Position(8, 6), Position(4, 0), Position(4, 3),
    Position(4, 6)
]


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

    @pytest.mark.parametrize("positions", [
        [Position(0, 0), Position(0, 6)],
        [Position(0, 6), Position(8, 0)],
        [Position(8, 0), Position(0, 0)],
        [Position(8, 6), Position(4, 3)],
        [Position(4, 3), Position(8, 0)],
    ])
    def test_copy_board(self, positions):
        board = Board.initialize()
        board_move_mock = Mock(board=board)

        result = BoardMove.copy_board(self=board_move_mock, positions=positions)

        assert isinstance(result, Board)
        for position in positions:
            assert result[position] is not board[position]
            assert result[position].occupant is board[position].occupant
        assert result.positions == board.positions
        assert result.moves == board.moves
        assert result.last_moves == board.last_moves

    @pytest.mark.parametrize("selected_unit, position", ALL_UNIT_POSITIONS_DICT.items())
    def test_remove_captured_unit(self, selected_unit, position):
        board = Board.initialize()

        BoardMove.remove_captured_unit(board, position)

        assert board[position].occupant is EMPTY
        assert board.moves.get(selected_unit) is None
        assert board.positions.get(selected_unit) is None

    @pytest.mark.parametrize("selected_unit, start_position", {
        BLACK_MOUSE: Position(2, 0), BLACK_CAT: Position(1, 5), BLACK_DOG: Position(1, 1),
        BLACK_WOLF: Position(2, 4), BLACK_LEOPARD: Position(2, 2), BLACK_ELEPHANT: Position(2, 6),
        WHITE_DEN: Position(8, 3), WHITE_MOUSE: Position(6, 6), WHITE_CAT: Position(7, 1),
        WHITE_DOG: Position(7, 5), WHITE_WOLF: Position(6, 2), WHITE_LEOPARD: Position(6, 4),
        WHITE_ELEPHANT: Position(6, 0)
    }.items())
    @pytest.mark.parametrize("end_position", EDGE_POSITIONS)
    def test_move_unit(self, selected_unit: Unit, start_position: Position,
                       end_position: Position):
        board = Board.initialize()

        BoardMove.move_unit(board=board, start_position=start_position, end_position=end_position)

        assert board[start_position].occupant is EMPTY
        assert board[end_position].occupant is selected_unit

    @pytest.mark.parametrize("unit", ALL_UNITS)
    @pytest.mark.parametrize("position", EDGE_POSITIONS)
    def test_update_unit(self, unit: Unit, position: Position):
        board = Board.initialize()
        get_single_unit_moves_return = Mock()
        board.get_single_unit_moves = Mock(return_value=get_single_unit_moves_return)

        BoardMove.update_unit(board=board, unit=unit, position=position)

        assert board.positions[unit] == position
        board.get_single_unit_moves.assert_called_once_with(position)
        assert board.moves[unit] == get_single_unit_moves_return

    POS_1 = Position(0, 0)
    POS_2 = Position(1, 0)
    POS_3 = Position(1, 1)

    @pytest.mark.parametrize("repetitions, start_position, end_position, expected", [
        (
                [deque([None, None, None, None, None]),
                 deque([None, None, None, None, None])],
                POS_1, POS_2,
                [deque([None, None, None, None, None]),
                 deque([None, None, None, None, (POS_1, POS_2)])]
        ),
        (
                [deque([(POS_2, POS_3), None, None, None, None]),
                 deque([(POS_1, POS_2), None, None, None, None])],
                POS_2, POS_1,
                [deque([(POS_1, POS_2), None, None, None, None]),
                 deque([None, None, None, None, (POS_2, POS_1)])]
        ),
        (
                [deque([(POS_1, POS_3), (POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3),
                        (POS_2, POS_3)]),
                 deque([None, None, None, None, None])],
                POS_3, POS_1,
                [deque([None, None, None, None, None]),
                 deque([(POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3),
                        (POS_3, POS_1)])]
        ),
        (
                [deque([(POS_1, POS_3), (POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3),
                        (POS_2, POS_3)]),
                 deque([(POS_3, POS_3), (POS_3, POS_3), (POS_3, POS_3), (POS_3, POS_3),
                        (POS_3, POS_3)])],
                POS_3, POS_2,
                [deque([(POS_3, POS_3), (POS_3, POS_3), (POS_3, POS_3), (POS_3, POS_3),
                        (POS_3, POS_3)]),
                 deque([(POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3), (POS_2, POS_3),
                        (POS_3, POS_2)])]
        ),
    ])
    def test_update_repetitions(self, repetitions, start_position, end_position, expected):
        board = Board.initialize()
        board.last_moves = repetitions

        BoardMove.update_repetitions(board=board, start_position=start_position,
                                     end_position=end_position)

        assert board.last_moves == expected
