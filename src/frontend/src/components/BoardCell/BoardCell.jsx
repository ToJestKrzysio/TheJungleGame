import "./BoardCell.scss"

function BoardCell({unit, selected, probability, isSelected, isValidMove, onClick:handleClick, visibleProbabilities}) {

    const cellClasses = ["cell"]
    const unitClasses = ["cell__unit"]

    if (isValidMove) {
        cellClasses.push("cell--valid_move")
    }

    if (unit.moves.length) {
        cellClasses.push("cell--occupied")
    }

    if (isSelected) {
        unitClasses.push("cell__unit--selected")
    } else {
        unitClasses.push(unit.white ? "cell__unit--white" : "cell__unit--black")
    }

    let unit_value = ""
    unit_value += unit.value ? unit.value : ""

    let probabilityValue = ""
    if (visibleProbabilities) {
        if (isValidMove) {
            probabilityValue = probability[selected] !== undefined ? probability[selected].toFixed(2) : ""
        } else {
            probabilityValue = probability.value ? probability.value.toFixed(2) : ""
        }
    }

    return (
        <div className={cellClasses.join(" ")} onClick={handleClick(unit)}>
            <p className="cell__probability">{probabilityValue}</p>
            <h2 className={unitClasses.join(" ")}>{unit_value}</h2>
        </div>
    );
}

export default BoardCell;
