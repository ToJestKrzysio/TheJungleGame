from flask import Flask, redirect, jsonify, request, url_for

from game import Board, get_move_by_values, Position, ValuePolicyModel
from mcts import Root
from storage import Storage

app = Flask(__name__)
storage = Storage()

model = ValuePolicyModel()
model.set_name(storage["model"])
model.load(storage["version"])

storage.board = Board.load(storage["state"])

@app.get("/api/board")
def get_board():
    return jsonify(storage.board.serialize()), 200


@app.post("/api/board")
def move_unit():
    origin = request.json["origin"]
    destination = request.json["destination"]

    unit_position = Position(x=origin % 7, y=origin // 7)

    selected_move = get_move_by_values(
        x=destination % 7 - unit_position.x,
        y=destination // 7 - unit_position.y
    )

    new_board = storage.board.move(unit_position=unit_position, selected_move=selected_move)
    storage.board = new_board

    root = Root(new_board, **{"MAX_EVALUATIONS": 20})
    _, (unit, best_move) = root.evaluate()
    current_position = new_board.positions[unit]
    computer_board = new_board.move(unit_position=current_position, selected_move=best_move)

    storage.board = computer_board

    return jsonify(computer_board.serialize()), 201


@app.post("/api/new-game")
def new_game():
    storage.board = Board.initialize()
    return redirect(url_for("get_board"))


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
