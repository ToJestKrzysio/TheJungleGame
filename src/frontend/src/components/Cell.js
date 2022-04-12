export default function Cell(
    {
        cell: {trap, unit, water},
        position,
        selected,
        cellsState:{cells, setCells}
    }
) {
    let cellClasses = "cell cell"
    cellClasses += water ? "__water" : "__land"
    cellClasses += (position.y + position.x) % 2 ? "--light" : "--dark"
    cellClasses += checkSelectedMoves(selected) ? " cell--move" : ""

    function checkSelectedMoves(selected) {
        return selected.state.unit.moves.some(
            (move) => position.x === move.x && position.y === move.y
        )
    }

    function moveUnit() {
        if (!checkSelectedMoves(selected) && unit.value < 2) {
            selected.default()
        } else if(selected.state.position !== null) {
            const movedUnit = selected.state.unit
            const movedUnitPosition = selected.state.position
            const newCells = [...cells]
            newCells[movedUnitPosition.y][movedUnitPosition.x].unit = {moves: [], value: 0, white: false}
            newCells[position.y][position.x].unit = movedUnit
            setCells(newCells)
            selected.default()
            // TODO add fetch to current execution
        }
    }

    return (
        <div className={cellClasses} onClick={moveUnit}>
            <Trap trap={trap}/>
            <Unit unit={unit} selected={selected} position={position}/>
        </div>
    )
}

function Trap({trap: {value, white}}) {
    if (value === false) {
        return ""
    }
    return (
        <div className={`trap ${white ? "trap--white" : "trap--black"}`}>
            <h1>TR</h1>
        </div>
    );
}

const unitTypes = {
    0: "empty",
    1: "den",
    2: "mouse",
    3: "cat",
    4: "dog",
    5: "wolf",
    6: "leopard",
    7: "tiger",
    8: "lion",
    9: "elephant",
}

function Unit({unit, selected: {state, set: setSelected}, position}) {
    const {value, white, moves} = unit
    if (value === 0) {
        return ""
    }

    let unitClasses = "unit"
    unitClasses += ` unit--${white ? "white" : "black"}`
    unitClasses += ` unit--${unitTypes[value]}`
    unitClasses += state.unit === unit ? " unit--selected" : ""
    unitClasses += moves.length === 0 ? " unit--invalid" : ""

    const selectAnimal = () => {
        if (moves.length > 0) {
            setSelected({position, unit})
        }
    }


    return (
        <div className={unitClasses} onClick={selectAnimal}>
            <h1>{value}</h1>
        </div>
    );
}
