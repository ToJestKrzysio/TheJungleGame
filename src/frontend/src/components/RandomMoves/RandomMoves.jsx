import "./RandomMoves.scss"
import AnimatedButton from "../AnimatedButton/AnimatedButton";
import useToggleState from "../../hooks/useToggleState";
import {useEffect} from "react";

function RandomMoves({loading, action, gameOver}) {
    const [isActive, toggleIsActive] = useToggleState(false)
    const classNames = isActive ? "toggle_button toggle_button--off" : "toggle_button toggle_button--on"
    const text = isActive ? "STOP" : "Random Moves"

    useEffect(() => {
        if (gameOver) toggleIsActive(false)
    }, [gameOver])

    useEffect(() => {
        if (isActive && !loading && !gameOver) action();
    }, [isActive, loading])

    return (
        <div className="model_form">
            <AnimatedButton
                value="Random Move"
                isLoading={loading}
                onClick={action}
                disabled={isActive}
            />
            <button
                className={classNames}
                onClick={toggleIsActive}
                style={{"width": "150px"}}
            >
                {text}
            </button>
        </div>
    );
}

export default RandomMoves;
