import logging
import os

from flask import Flask, redirect, jsonify, request, url_for

from game import Board, get_move_by_values, Position, ValuePolicyModel
from mcts import Root
from storage import Storage

from utils.formatters import ColoredFormatter

logging_formatter = ColoredFormatter()
logging_handler = logging.StreamHandler()
logging_handler.setFormatter(logging_formatter)
root = logging.getLogger()
root.setLevel(logging.INFO)
root.addHandler(logging_handler)

logging.warning("Running initial setup")
app = Flask(__name__)
storage = Storage()

model = ValuePolicyModel()
model.set_name(storage["model"])
model.load(storage["version"])

storage.board = Board.load(storage["state"])
storage.board.model = model
logging.warning("Completed initial setup")


@app.get("/api/board")
def get_board():
    storage.root = Root(storage.board, **{"MAX_EVALUATIONS": storage["evaluations"]})
    storage.root.evaluate()
    return jsonify(storage.board.serializer.serialize_board(storage.board, storage.root)), 200


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

    storage.board = storage.board.move(unit_position=unit_position, selected_move=selected_move)

    storage.root = Root(storage.board, **{"MAX_EVALUATIONS": storage["evaluations"]})
    _, (unit, best_move) = storage.root.evaluate()
    current_position = storage.board.positions[unit]

    storage.board = storage.board.move(unit_position=current_position, selected_move=best_move)

    storage.root = Root(storage.board, **{"MAX_EVALUATIONS": storage["evaluations"]})
    storage.root.evaluate()
    return jsonify(storage.board.serializer.serialize_board(storage.board, storage.root)), 201


@app.post("/api/new-game")
def new_game():
    storage.board = Board.initialize()
    logging.debug("Restarting game")
    return redirect(url_for("get_board"))


@app.get("/api/models")
def model_list():
    return jsonify(os.listdir("./data/models"))


@app.get("/api/models/<name>")
def version_list(name):
    return jsonify(os.listdir(f"./data/models/{name}"))


@app.post("/api/models")
def model_select():
    model = request.json["model"]
    version = request.json["version"]

    storage["model"] = model
    storage["version"] = version
    storage.load_model()

    return jsonify({"message": f"Successfully loaded model {model} version {version}"}), 200


@app.get("/api/evaluations")
def get_evaluations():
    return jsonify({"value": storage["evaluations"]}), 200


@app.post("/api/evaluations")
def post_evaluations():
    evaluations = request.json["value"]
    storage["evaluations"] = evaluations
    return jsonify({"message": f"Successfully set evaluations to {evaluations}"}), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
