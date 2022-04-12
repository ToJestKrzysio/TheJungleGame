import Cell from "./Cell";

export default function CellRow({row, rowId, selected, cellsState}) {
    return (
        <div className="row">
            {
                row.map((cell, colId) => {
                    return (
                        <Cell
                            cell={cell}
                            position={{y: rowId, x: colId}}
                            key={colId}
                            selected={selected}
                            cellsState={cellsState}/>
                    );
                })
            }
        </div>
    );
}