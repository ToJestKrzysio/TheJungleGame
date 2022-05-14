import "./BoardCell.scss"

function BoardCell({unit, selected, probability, isSelected, isValidMove, onClick:handleClick, maxProbability}) {

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

    let probabilityValue
    if (isValidMove) {
        probabilityValue = probability[selected] !== undefined ? probability[selected].toFixed(2) : ""
    } else {
        probabilityValue = probability.value ? probability.value.toFixed(2) : ""
    }

    const descriptionClasses = ["cell__probability"];
    if (Object.values(probability).includes(maxProbability)) descriptionClasses.push("cell__probability--highlight");


    return (
        <div className={cellClasses.join(" ")} onClick={handleClick(unit)}>
            <p className={descriptionClasses.join(" ")}>{probabilityValue}</p>
            <h2 className={unitClasses.join(" ")}>{unit_value}</h2>
        </div>
    );
}

export default BoardCell;
