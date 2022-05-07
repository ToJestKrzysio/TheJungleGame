import "./AnimatedButton.scss"

function AnimatedButton({onClick:handleClick, isLoading, value}) {

    return (
        <button onClick={handleClick} className="animated_button">
            {value}
        </button>
    );
}

export default AnimatedButton;
