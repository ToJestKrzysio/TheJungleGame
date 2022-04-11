export default function Cell({cell: {trap, unit, water}, cellId}) {
    let className = "cell"
    className += water ? "__water" : "__land"
    className += cellId % 2 ? "--light" : "--dark"

    // TODO add trap component
    // TODO add unit component
    return (
        <div className={`cell ${className}`}>
            <Trap trap={trap}/>
            <Unit unit={unit}/>
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

function Unit({unit: {value, white, moves}}) {
    if (value === 0) {
        return ""
    }

    let unitClasses = "unit"
    unitClasses += ` unit--${white ? "white" : "black"}`
    unitClasses += ` unit--${unitTypes[value]}`

    return (
        <div className={unitClasses}>
            <h1>{value}</h1>
        </div>
    );
}
