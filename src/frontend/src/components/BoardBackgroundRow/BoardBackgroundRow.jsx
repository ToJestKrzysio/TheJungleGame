import "./BoardBackgroundRow.scss"

function BoardBackgroundRow({row, rowID}) {
    const rowElements = row.map((isWater, colID) => {
        let className = "BackgroundCell BackgroundCell"
        className += isWater ? "__water" : "__land"
        className += (rowID + colID) % 2 ? "--light" : "--dark"
        return <div className={className}></div>
    })

    return (
        <div className="BackgroundRow">
            {rowElements}
        </div>
    );
}

export default BoardBackgroundRow;
