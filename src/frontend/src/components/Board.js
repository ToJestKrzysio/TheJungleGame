import {useEffect, useState} from "react";

export default function Board() {
    const {cells, setCells} = useState([])

    useEffect(() => {
        fetch("/api/board")
            .then(data => data.json())
            .then(data => setCells(data))
    }, [])

    return (
        <div className="board">
            {/*<div className="cell">T1</div>*/}
            {cells}
        </div>
    );
}
