import Cell from "./Cell";

export default function CellRow({row, rowId}) {
    return (
        <div className="row">
            {
                row.map((cell, id) => {
                    const cellId = id + row.length * rowId
                    return <Cell cell={cell} cellId={cellId} key={cellId}/>
                })
            }
        </div>
    );
}
