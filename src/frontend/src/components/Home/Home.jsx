import "./Home.scss"
import ModelSelect from "../ModelSelect/ModelSelect";
import Board from "../Board/Board";
import EvaluationsSelect from "../EvaluationsSelect/EvaluationsSelect";
import NewGame from "../NewGame/NewGame";
import {postNewGame} from "../../utils/helpers";
import {useState} from "react";
import UpdateBoard from "../UpdateBoard/UpdateBoard";
import ButtonFooter from "../ButtonFooter/ButtonFooter";

function Home() {
    const [newGameLoading, setNewGameLoading] = useState(false)
    const [boardUpdateLoading, setBoardUpdateLoading] = useState(true)
    const [completeUpdate, setCompleteUpdate] = useState(() => () => setBoardUpdateLoading(false))

    function startNewGame() {
        setNewGameLoading(true)
        postNewGame()
            .then(data => {
                setCompleteUpdate(() => () => setNewGameLoading(false))
                console.log(data.message)
            })
            .catch(err => {
                alert(err)
                setNewGameLoading(false)
            })
    }

    function updateBoard() {
        setBoardUpdateLoading(true)
        setCompleteUpdate(() => () => setBoardUpdateLoading(false))
    }

    return (
        <div className="Home">
            <div className="BoardColumn">
                <Board completeUpdate={completeUpdate}/>
            </div>
            <div className="NavigationColumn">
                <ModelSelect/>
                <EvaluationsSelect/>
                <ButtonFooter>
                    <UpdateBoard onClick={updateBoard} isLoading={boardUpdateLoading}/>
                    <NewGame onClick={startNewGame} isLoading={newGameLoading}/>
                </ButtonFooter>
            </div>
        </div>
    );
}

export default Home;
