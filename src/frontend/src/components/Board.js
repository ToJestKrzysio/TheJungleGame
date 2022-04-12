import {useEffect, useState, useContext} from "react";
import CellRow from "./CellRow";

export default function Board() {
    const [cells, setCells] = useState(
        [...Array(9)].map(() => [...Array(7)].map(createDefaultCellObject))
    )
    const [selected, setSelected] = useState({position: null, unit: {moves: [], value: 0, white: false}})

    function selectedDefault() {
        setSelected({position: null, unit: {moves: [], state: 0, white: false}})
    }

    function createDefaultCellObject() {
        return {
            trap: {
                value: false,
                white: false
            },
            unit: {
                moves: [],
                value: 0,
                white: false
            },
            water: false,

        }
    }

    useEffect(() => {
        fetch("/api/board")
            .then(data => data.json())
            .then(data => setCells(data))
    }, [])

    const rows = cells.map((row, rowId) => (
            <CellRow
                row={row}
                rowId={rowId}
                key={rowId}
                selected={{state: selected, set: setSelected, default: selectedDefault}}
                cellsState={{cells, setCells}}
            />
        )
    )

    return (
        <div className="board">
            {rows}
        </div>
    );
}
