import {useEffect, useState, useContext} from "react";
import CellRow from "./CellRow";

export default function Board() {
    const [cells, setCells] = useState(
        [...Array(9)].map(() => [...Array(7)].map(createDefaultCellObject))
    )
    const [selected, setSelected] = useState({moves: [], value: 0, white: false})

    function selectedDefault() {
        setSelected({moves: [], value: 0, white: false})
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
                selected={{value: selected, set: setSelected, default: selectedDefault}}/>
        )
    )

    return (
        <div className="board">
            {rows}
        </div>
    );
}
