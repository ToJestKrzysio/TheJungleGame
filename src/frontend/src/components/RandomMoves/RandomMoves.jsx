import "./RandomMoves.scss"
import AnimatedButton from "../AnimatedButton/AnimatedButton";
import useToggleState from "../../hooks/useToggleState";

function RandomMoves({loading, action}) {
    const [isActive, toggleIsActive] = useToggleState(false)

    return (
        <div className="model_form">
            <AnimatedButton
                value="Random Move"
                isLoading={loading}
                onClick={action}
                disabled={isActive}
            />
        </div>
);
}

export default RandomMoves;
