import "./BoardCell.scss"

function BoardCell({trap, unit, isSelected, onClick:handleClick}) {

    const classNames = ["cell"]

    if (isSelected) {
        classNames.push("cell--selected")
    } else {
        classNames.push(unit.white ? "cell--white" : "cell--black")
    }

    if (unit.value) {
        classNames.push("cell--occupied")
    }

    let state = ""
    state += unit.value ? unit.value : ""
    state += trap.value ? "X" : ""


    return (
        <div className={classNames.join(" ")} onClick={handleClick(unit)}>{state}</div>
    );
}

export default BoardCell;
