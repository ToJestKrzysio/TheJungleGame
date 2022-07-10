import "./Board.scss"
import {useState} from "react";

import BoardCell from "../BoardCell/BoardCell";
import BoardBackground from "../BoardBackground/BoardBackground";
import GameOver from "../GameOver/GameOver";

function Board({cells, setCells, setMove, nextTurn, gameOver, visibleProbabilities}) {
    const [selected, setSelected] = useState(null);

    function selectCell(id) {
        return function (unit) {
            return function () {
                if (selected && cells[selected].unit.moves.includes(id)) {
                    const newCells = JSON.parse(JSON.stringify(cells))

                    newCells[id].unit = newCells[selected].unit
                    newCells[selected].unit = {moves: [], value: 0, white: false}

                    newCells.forEach(cell => {
                        cell.unit.moves = []
                        cell.probability.value = 0
                    })

                    setCells(newCells)
                    nextTurn()
                    setSelected(null)
                    setMove({selected, id})
                } else {
                    setSelected(unit.moves.length ? id : null)
                }
            }
        }
    }

    function isValidMove(id) {
        if (selected === null) {
            return false
        }
        return cells[selected].unit.moves.includes(id)
    }

    const cellElements = cells.map((cell) => {
        return (
            <BoardCell
                key={cell.id}
                unit={cell.unit}
                selected={selected}
                probability={cell.probability}
                isSelected={cell.id === selected}
                isValidMove={isValidMove(cell.id)}
                onClick={selectCell(cell.id)}
                visibleProbabilities={visibleProbabilities}
            />
        )
    })

    return (<div className="board">
        <div className="board__overlay">
            {cellElements}
            <GameOver game_over={gameOver}/>
        </div>
        <BoardBackground/>
    </div>);
}

export default Board;
