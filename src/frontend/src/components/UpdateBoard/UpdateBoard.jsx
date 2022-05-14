import "./UpdateBoard.scss"
import AnimatedButton from "../AnimatedButton/AnimatedButton";

function UpdateBoard({onClick: handleClick, isLoading}) {
    return (
        <div>
            <AnimatedButton onClick={handleClick} isLoading={isLoading} value="Reload Board" />
        </div>
    );
}

export default UpdateBoard;
