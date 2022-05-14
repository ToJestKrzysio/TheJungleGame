import "./NewGame.scss"
import AnimatedButton from "../AnimatedButton/AnimatedButton";

function NewGame({onClick:handleClick, isLoadingNewGame}) {
    return (
        <div className="new_game">
            <AnimatedButton onClick={handleClick} isLoading={isLoadingNewGame} value="New Game"/>
        </div>
    );
}

export default NewGame;
