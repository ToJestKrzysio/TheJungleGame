import "./Home.scss"
import ModelSelect from "../ModelSelect/ModelSelect";
import Board from "../Board/Board";
import EvaluationsSelect from "../EvaluationsSelect/EvaluationsSelect";
import NewGame from "../NewGame/NewGame";
import {fetchBoardState, postMove, postNewGame} from "../../utils/helpers";
import {useEffect, useState} from "react";
import UpdateBoard from "../UpdateBoard/UpdateBoard";
import ProbabilityToggle from "../ProbabilityToggle/ProbabilityToggle";
import useToggleState from "../../hooks/useToggleState";
import generateNewCellsForMove from "../../utils/generateNewCellsForMove";
import RandomMoves from "../RandomMoves/RandomMoves";

function Home() {
    const rows = 9;
    const cols = 7;

    const [cells, setCells] = useState(createDefaultCells);
    const [value, setValue] = useState(0);
    const [turn, setTurn] = useState(0);
    const [gameOver, setGameOver] = useState(0);
    const [move, setMove] = useState(null);
    const [newGameLoading, setNewGameLoading] = useState(false);
    const [boardUpdateLoading, setBoardUpdateLoading] = useState(true);
    const [visibleProbabilities, toggleVisibleProbabilities] = useToggleState(false)

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
                setTurn(data.turn)
                setGameOver(data.game_over)
            })
            .catch(err => console.log(err))
            .finally(() => setBoardUpdateLoading(false))
    }, [move])

    useEffect(() => updateTitle(gameOver, turn), [gameOver, turn])

    function updateTitle(game_over, turn) {
        if (game_over === 1) {
            document.title = `White player won after ${turn} turns`
        } else if (game_over === -1) {
            document.title = `Black player won after ${turn} turns`
        } else {
            document.title = `Turn: ${turn}`
        }

    }

    function updateBoardState(cb = () => null) {
        fetchBoardState()
            .then(data => {
                setCells(data.cells)
                setValue(data.value)
                setTurn(data.turn)
                setGameOver(data.game_over)
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

    function moveRandomUnit() {
        const validUnits = cells.filter(cell => cell.unit.value && cell.unit.moves.length)
        const selectedCell = validUnits[Math.floor(Math.random() * validUnits.length)]

        const best_move = {move: 0, value: 100}
        selectedCell.unit.moves.forEach((position) => {
            const distance = Math.abs(position % 7 - 3) + Math.floor(position / 7)
            if (distance < best_move.value) {
                best_move.move = position
                best_move.value = distance
            }
        })

        const newCells = generateNewCellsForMove(cells, selectedCell.id, best_move.move)
        setCells(newCells)
        nextTurn()
        setMove({id: best_move.move, selected: selectedCell.id})
    }

    function nextTurn() {
        setTurn(turn + 1)
    }

    return (
        <div className="Home">
            <div className="BoardColumn">
                <Board
                    cells={cells}
                    setCells={setCells}
                    setMove={setMove}
                    gameOver={gameOver}
                    nextTurn={nextTurn}
                    visibleProbabilities={visibleProbabilities}
                />
            </div>
            <div className="NavigationColumn">
                <div className="NavigationColumn__header">
                    <h2>Current Board Value: {value.toFixed(2)}</h2>
                    <h3>Turn: {turn}</h3>
                </div>
                <ModelSelect/>
                <EvaluationsSelect/>
                <div className="spacer"></div>
                <ProbabilityToggle visible={visibleProbabilities} toggleVisible={toggleVisibleProbabilities}/>
                <RandomMoves loading={boardUpdateLoading} action={moveRandomUnit} gameOver={gameOver}/>
                <div className="NavigationColumn__footer">
                    <UpdateBoard onClick={updateBoard} isLoading={boardUpdateLoading}/>
                    <NewGame onClick={startNewGame} isLoading={newGameLoading}/>
                </div>
            </div>
        </div>
    );
}

export default Home;
