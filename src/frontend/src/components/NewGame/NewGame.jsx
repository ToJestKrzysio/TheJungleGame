import "./NewGame.scss"
import AnimatedButton from "../AnimatedButton/AnimatedButton";

function NewGame({onClick:handleClick, isLoading}) {

    return (
        <div className="new_game">
            <AnimatedButton onClick={handleClick} isLoading={isLoading} value="New Game"/>
        </div>
    );
}

export default NewGame;
