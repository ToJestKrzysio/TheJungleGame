import "./Board.scss"
import {useEffect, useState} from "react";
import {fetchBoardState, postMove} from "../../utils/helpers";

import BoardCell from "../BoardCell/BoardCell";
import BoardBackground from "../BoardBackground/BoardBackground";

function Board() {
    const rows = 9;
    const cols = 7;

    const [cells, setCells] = useState(createDefaultCells());
    const [selected, setSelected] = useState(null)

    useEffect(() => {
        fetchBoardState().then(data => setCells(data))
    }, [])

    function createDefaultCells() {
        return [...Array(rows * cols)]
            .map((_, id) => ({
                id: id,
                trap: {value: false, white: false},
                unit: {moves: [], value: 0, white: false},
                water: false
            }))
    }

    function selectCell(id) {
        return function (unit) {
            return function () {
                if (selected && cells[selected].unit.moves.includes(id)) {
                    const newCells = JSON.parse(JSON.stringify(cells))

                    newCells[id].unit = newCells[selected].unit
                    newCells[selected].unit = {moves: [], value: 0, white: false}

                    newCells.forEach(cell => cell.unit.moves = [])

                    setCells(newCells)
                    setSelected(null)
                    postMove(selected, id)
                        .then(data => setCells(data))
                        .catch(err => window.alert(err))
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
                // trap={cell.trap}
                unit={cell.unit}
                isSelected={cell.id === selected}
                isValidMove={isValidMove(cell.id)}
                onClick={selectCell(cell.id)}
            />
        )
    })

    return (<div className="board">
        <div className="board__overlay">
            {cellElements}
        </div>
        <BoardBackground/>
    </div>);
}

export default Board;
