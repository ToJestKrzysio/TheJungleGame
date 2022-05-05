import logging
import os

from flask import Flask, redirect, jsonify, request, url_for

from game import Board, get_move_by_values, Position, ValuePolicyModel
from mcts import Root
from storage import Storage

from utils.models import get_model_versions
from utils.formatters import ColoredFormatter

logging_formatter = ColoredFormatter()
logging_handler = logging.StreamHandler()
logging_handler.setFormatter(logging_formatter)
root = logging.getLogger()
root.setLevel(logging.DEBUG)
root.addHandler(logging_handler)

logging.debug("Running initial setup")
app = Flask(__name__)
storage = Storage()

model = ValuePolicyModel()
model.set_name(storage["model"])
model.load(storage["version"])

storage.board = Board.load(storage["state"])
storage.board.model = model
logging.debug("Completed initial setup")


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
    logging.debug(f"Requested {selected_move} from {unit_position}.")

    new_board = storage.board.move(unit_position=unit_position, selected_move=selected_move)
    storage.board = new_board

    root = Root(new_board, **{"MAX_EVALUATIONS": storage["evaluations"]})
    _, (unit, best_move) = root.evaluate()
    current_position = new_board.positions[unit]
    computer_board = new_board.move(unit_position=current_position, selected_move=best_move)

    storage.board = computer_board

    return jsonify(computer_board.serialize()), 201


@app.post(f"/api/new-game")
def new_game():
    storage.board = Board.initialize()
    logging.debug("Restarting game")
    return redirect(url_for("get_board"))


@app.get("/api/models")
def model_list():
    versioned = {name: get_model_versions(name) for name in os.listdir("./data/models")}
    return jsonify(versioned)


@app.post("/api/models")
def model_select():
    name = request.json["name"]
    version = request.json["version"]

    storage["model"] = name
    storage["version"] = version
    storage.load_model()

    return jsonify({"message": f"Successfully loaded model {model} version {version}"}), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
