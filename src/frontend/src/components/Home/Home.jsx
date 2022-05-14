import "./Home.scss"
import ModelSelect from "../ModelSelect/ModelSelect";
import Board from "../Board/Board";
import EvaluationsSelect from "../EvaluationsSelect/EvaluationsSelect";
import NewGame from "../NewGame/NewGame";
import {fetchBoardState, postMove, postNewGame} from "../../utils/helpers";
import {useEffect, useState} from "react";
import UpdateBoard from "../UpdateBoard/UpdateBoard";


function Home() {
    const rows = 9;
    const cols = 7;

    const [cells, setCells] = useState(createDefaultCells);
    const [value, setValue] = useState(0);
    const [turn, setTurn] = useState(0);
    const [move, setMove] = useState(null);
    const [newGameLoading, setNewGameLoading] = useState(false);
    const [boardUpdateLoading, setBoardUpdateLoading] = useState(true);

    function createDefaultCells() {
        return [...Array(rows * cols)]
            .map((_, id) => ({
                id: id,
                trap: {value: false, white: false},
                unit: {moves: [], value: 0, white: false},
                water: false,
                probability: {value: 0}
            }))
    }

    useEffect(() => updateBoardState(() => setBoardUpdateLoading(false)), [])

    useEffect(() => {
        if (move === null) return;

        setBoardUpdateLoading(true)
        postMove(move.selected, move.id)
            .then(data => {
                setCells(data.cells)
                setValue(data.value)
            })
            .catch(err => console.log(err))
            .finally(() => setBoardUpdateLoading(false))
    }, [move])

    function updateBoardState(cb = () => null) {
        fetchBoardState()
            .then(data => {
                setCells(data.cells)
                setValue(data.value)
            })
            .catch(err => console.log(err))
            .finally(cb())
    }

    function startNewGame() {
        setNewGameLoading(true)
        postNewGame()
            .then(data => {
                console.log(data.message)
                updateBoardState();
            })
            .catch(err => console.log(err))
            .finally(() => setNewGameLoading(false))
    }

    function updateBoard() {
        setBoardUpdateLoading(true)
        updateBoardState(() => setBoardUpdateLoading(false))
    }

    return (
        <div className="Home">
            <div className="BoardColumn">
                <Board cells={cells} setCells={setCells} setMove={setMove}/>
            </div>
            <div className="NavigationColumn">
                <div className="NavigationColumn__header">
                    <h2>Current Board Value: {value.toFixed(2)}</h2>
                    <h4>Turn: {turn}</h4>
                </div>
                <ModelSelect/>
                <EvaluationsSelect/>
                <div className="NavigationColumn__footer">
                    <UpdateBoard onClick={updateBoard} isLoading={boardUpdateLoading}/>
                    <NewGame onClick={startNewGame} isLoading={newGameLoading}/>
                </div>
            </div>
        </div>
    );
}

export default Home;
