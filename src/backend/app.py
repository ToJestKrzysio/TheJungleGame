import time

from flask import Flask, redirect, jsonify

from game import Board, value_policy_model
from server import serialize_board

app = Flask(__name__)
value_policy_model.set_name("first_model")
value_policy_model.load("5")
board = Board.initialize()


@app.route("/", methods=["GET"])
def get_board():
    return jsonify(serialize_board(board)), 200


# @app.route("/", methods=["GET"])
# def get_board():
#     return "42", 200


@app.route("/new-game", methods=["POST"])
def start_new_game():
    board = Board.initialize()
    return redirect("/", code=200)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
