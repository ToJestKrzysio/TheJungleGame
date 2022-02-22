from unittest import mock

import pytest
import src.mcts.mcts_node
import src.game.moves
import src.game.board


class TestNode:
    PATH = "src.mcts.mcts_node"
    WHITE_UNIT_1 = mock.Mock(white=True)
    WHITE_UNIT_2 = mock.Mock(white=True)
    BLACK_UNIT_1 = mock.Mock(white=False)
    BLACK_UNIT_2 = mock.Mock(white=False)

    def test__init__no_parent(self):
        node_mock = mock.Mock()
        board_mock = mock.Mock()
        move_mock = mock.Mock()
        src.mcts.mcts_node.Node.__init__(self=node_mock, board=board_mock, move=move_mock,
                                         parent=None)

        assert node_mock.depth == 1

    @pytest.mark.parametrize("depth", [13, 0, 21, 7])
    def test__init__with_parent(self, depth):
        node_mock = mock.Mock()
        board_mock = mock.Mock()
        move_mock = mock.Mock()
        parent = mock.Mock(depth=depth)

        src.mcts.mcts_node.Node.__init__(self=node_mock, board=board_mock, move=move_mock,
                                         parent=parent)

        assert node_mock.depth == depth + 1

    def test_evaluate(self):
        node_mock = mock.Mock(spec=src.mcts.mcts_node.Node)
        policy_strategy = mock.Mock()
        node_mock.policy_strategy = policy_strategy

        src.mcts.mcts_node.Node.evaluate(self=node_mock)

        policy_strategy.assert_called_once_with(node_mock)

    def test_get_value(self):
        node_mock = mock.Mock(spec=src.mcts.mcts_node.Node)
        value_strategy = mock.Mock()
        node_mock.value_strategy = value_strategy

        src.mcts.mcts_node.Node.get_value(self=node_mock)

        value_strategy.assert_called_once_with(node_mock)

    @pytest.mark.parametrize("moves, positions, new_boards, new_nodes, units, player_moves", [
        [
            {
                WHITE_UNIT_1: src.game.moves.base_moves,
                BLACK_UNIT_1: src.game.moves.base_moves,
            },
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [WHITE_UNIT_1, WHITE_UNIT_1, WHITE_UNIT_1, WHITE_UNIT_1],
            src.game.moves.base_moves,
        ],
        [
            {
                WHITE_UNIT_1: src.game.moves.base_moves,
                WHITE_UNIT_2: src.game.moves.base_moves,
            },
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [
                WHITE_UNIT_1, WHITE_UNIT_1, WHITE_UNIT_1, WHITE_UNIT_1,
                WHITE_UNIT_2, WHITE_UNIT_2, WHITE_UNIT_2, WHITE_UNIT_2
            ],
            (*src.game.moves.base_moves, *src.game.moves.base_moves)
        ],
        [
            {
                BLACK_UNIT_1: src.game.moves.base_moves,
                WHITE_UNIT_2: src.game.moves.jump_moves,
            },
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [WHITE_UNIT_2, WHITE_UNIT_2, WHITE_UNIT_2, WHITE_UNIT_2],
            src.game.moves.jump_moves
        ],
        [
            {
                BLACK_UNIT_1: src.game.moves.jump_moves,
                BLACK_UNIT_2: src.game.moves.base_moves,
            },
            [],
            [],
            [],
            [],
            [],
        ],
        [
            {
                BLACK_UNIT_1: (*src.game.moves.base_moves, *src.game.moves.jump_moves),
                WHITE_UNIT_2: (*src.game.moves.base_moves, *src.game.moves.jump_moves),
            },
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [WHITE_UNIT_2] * 8,
            (*src.game.moves.base_moves, *src.game.moves.jump_moves),
        ],
        [
            {
                WHITE_UNIT_1: tuple(),
                BLACK_UNIT_2: tuple(),
            },
            [],
            [],
            [],
            [],
            [],
        ]
    ])
    @mock.patch(f"{PATH}.Node.__new__")
    def test_expand_node_white_moves(self, node_patch, moves, positions, new_boards, new_nodes,
                                     units, player_moves):
        board_mock = mock.MagicMock(moves=moves, white_move=True)
        board_mock.positions.__getitem__.side_effect = positions
        board_mock.move.side_effect = new_boards
        node_patch.side_effect = new_nodes
        node_mock = mock.Mock(board=board_mock)
        append_mock = mock.Mock()
        node_mock.child_nodes.append = append_mock

        src.mcts.mcts_node.Node.expand_node(self=node_mock)

        node_calls = [mock.call(mock.ANY, board=board, parent=node_mock, move=(unit, move))
                      for board, unit, move in zip(new_boards, units, player_moves)]
        assert node_patch.mock_calls == node_calls
        move_calls = [mock.call(unit_position=position, selected_move=move)
                      for board, position, move in zip(new_boards, positions, player_moves)]
        board_mock.move.assert_has_calls(move_calls)
        append_calls = [mock.call(node) for node in new_nodes]
        append_mock.assert_has_calls(append_calls)

    @pytest.mark.parametrize("moves, positions, new_boards, new_nodes, units, player_moves", [
        [
            {
                WHITE_UNIT_1: src.game.moves.base_moves,
                BLACK_UNIT_2: src.game.moves.base_moves,
            },
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [BLACK_UNIT_2, BLACK_UNIT_2, BLACK_UNIT_2, BLACK_UNIT_2],
            src.game.moves.base_moves,
        ],
        [
            {
                WHITE_UNIT_1: src.game.moves.base_moves,
                WHITE_UNIT_2: src.game.moves.base_moves,
            },
            [],
            [],
            [],
            [],
            [],
        ],
        [
            {
                BLACK_UNIT_1: src.game.moves.jump_moves,
                WHITE_UNIT_2: src.game.moves.base_moves,
            },
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [mock.Mock() for _ in range(4)],
            [BLACK_UNIT_1, BLACK_UNIT_1, BLACK_UNIT_1, BLACK_UNIT_1],
            src.game.moves.jump_moves
        ],
        [
            {
                BLACK_UNIT_1: src.game.moves.jump_moves,
                BLACK_UNIT_2: src.game.moves.base_moves,
            },
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [
                BLACK_UNIT_1, BLACK_UNIT_1, BLACK_UNIT_1, BLACK_UNIT_1,
                BLACK_UNIT_2, BLACK_UNIT_2, BLACK_UNIT_2, BLACK_UNIT_2
            ],
            [*src.game.moves.jump_moves, *src.game.moves.base_moves],
        ],
        [
            {
                BLACK_UNIT_1: (*src.game.moves.base_moves, *src.game.moves.jump_moves),
                WHITE_UNIT_2: (*src.game.moves.base_moves, *src.game.moves.jump_moves),
            },
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [mock.Mock() for _ in range(8)],
            [BLACK_UNIT_1] * 8,
            (*src.game.moves.base_moves, *src.game.moves.jump_moves),
        ],
        [
            {
                WHITE_UNIT_1: tuple(),
                BLACK_UNIT_2: tuple(),
            },
            [],
            [],
            [],
            [],
            [],
        ]
    ])
    @mock.patch(f"{PATH}.Node.__new__")
    def test_expand_node_black_moves(self, node_patch, moves, positions, new_boards, new_nodes,
                                     units, player_moves):
        board_mock = mock.MagicMock(moves=moves, white_move=False)
        board_mock.positions.__getitem__.side_effect = positions
        board_mock.move.side_effect = new_boards
        node_patch.side_effect = new_nodes
        node_mock = mock.Mock(board=board_mock)
        append_mock = mock.Mock()
        node_mock.child_nodes.append = append_mock

        src.mcts.mcts_node.Node.expand_node(self=node_mock)

        node_calls = [mock.call(mock.ANY, board=board, parent=node_mock, move=(unit, move))
                      for board, unit, move in zip(new_boards, units, player_moves)]
        assert node_patch.mock_calls == node_calls
        move_calls = [mock.call(unit_position=position, selected_move=move)
                      for board, position, move in zip(new_boards, positions, player_moves)]
        board_mock.move.assert_has_calls(move_calls)
        append_calls = [mock.call(node) for node in new_nodes]
        append_mock.assert_has_calls(append_calls)

    @pytest.mark.parametrize("value, visits, expected", [
        (14, 2, 7),
        (7, 0, 0),
        (0, 0, 0),
        (0, 14, 0),
        (1, 197434, 1 / 197434),
    ])
    def test_q(self, value, visits, expected):
        node = src.mcts.mcts_node.Node(mock.Mock())
        node.value = value
        node.visits = visits

        assert node.q == expected
