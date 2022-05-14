import "./Home.scss"
import ModelSelect from "../ModelSelect/ModelSelect";
import Board from "../Board/Board";
import EvaluationsSelect from "../EvaluationsSelect/EvaluationsSelect";
import NewGame from "../NewGame/NewGame";
import {postNewGame} from "../../utils/helpers";
import {useState} from "react";

function Home() {
    const [newGameLoading, setNewGameLoading] = useState(false)
    const [completeUpdate, setCompleteUpdate] = useState(() => () => {})

    async function startNewGame() {
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

    return (
        <div className="Home">
            <div className="BoardColumn">
                <Board completeUpdate={completeUpdate}/>
            </div>
            <div className="NavigationColumn">
                <ModelSelect/>
                <EvaluationsSelect/>
                <NewGame onClick={startNewGame} isLoading={newGameLoading}/>
            </div>
        </div>
    );
}

export default Home;
