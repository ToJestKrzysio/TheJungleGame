import "./Board.scss"
import {useEffect, useState} from "react";
import {fetchBoardState} from "../../utils/helpers";

import BoardCell from "../BoardCell/BoardCell";
import BoardBackground from "../BoardBackground/BoardBackground";

function Board() {
    const [cells, setCells] = useState(createDefaultCells());
    const [selected, setSelected] = useState(null)

    function setSelectedDefault() {
        setSelected({position: null, unit: {moves: [], state: 0, white: false}})
    }

    useEffect(() => {
        fetchBoardState().then(data => setCells(data))
    }, [])

    function createDefaultCells() {
        const rows = 9;
        const cols = 7;
        return [...Array(rows)]
            .map((_, rowID) => ([...Array(cols)].map((_, colID) => ({
                id: rowID * cols + colID,
                trap: {value: false, white: false},
                unit: {moves: [], value: 0, white: false},
                water: false
            }))))
    }

    function selectCell(id) {
        return function (unit) {
            return function() {
                if (unit.value > 1) {
                    setSelected(id)
                } else {
                    setSelectedDefault()
                }
            }
        }
    }

    const cellElements = cells.flat().map((cell) => (
        <BoardCell
            key={cell.id}
            trap={cell.trap}
            unit={cell.unit}
            isSelected={cell.id === selected}
            onClick={selectCell(cell.id)}
        />
    ))

    return (<div className="board">
        <div className="board__overlay">
            {cellElements}
        </div>
        <BoardBackground/>
    </div>);
}

export default Board;