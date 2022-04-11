import {useEffect, useState} from "react";
import CellRow from "./CellRow";

export default function Board() {
    const [cells, setCells] = useState(
        [...Array(9)].map(() => [...Array(7)].map(createDefaultCellObject))
    )

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

    return (
        <div className="board">
            {cells.map((row, rowId) => <CellRow row={row} rowId={rowId} key={rowId}/>)}
        </div>
    );
}
