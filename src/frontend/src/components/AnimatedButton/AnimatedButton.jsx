import "./AnimatedButton.scss"

function AnimatedButton({onClick:handleClick, isLoading = false, value}) {

    return (
        <button onClick={handleClick} className="animated_button">
            {isLoading ? "" : value}
        </button>
    );
}

export default AnimatedButton;
