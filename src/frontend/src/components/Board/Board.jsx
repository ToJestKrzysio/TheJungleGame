import "./Board.scss"
import {useState} from "react";

import BoardCell from "../BoardCell/BoardCell";
import BoardBackground from "../BoardBackground/BoardBackground";
import GameOver from "../GameOver/GameOver";
import generateNewCellsForMove from "../../utils/generateNewCellsForMove";

function Board({cells, setCells, setMove, nextTurn, gameOver, visibleProbabilities}) {
    const [selected, setSelected] = useState(null);

    function selectCell(id) {
        return function (unit) {
            return function () {
                if (selected && cells[selected].unit.moves.includes(id)) {
                    const newCells = generateNewCellsForMove(cells, selected, id)

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
