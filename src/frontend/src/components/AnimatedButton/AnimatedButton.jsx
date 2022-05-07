import "./AnimatedButton.scss"
import BarLoader from "../BarLoader/BarLoader";

function AnimatedButton({onClick:handleClick, isLoading, value}) {

    const classNames = ["animated_button"]
    if (!isLoading) {
        classNames.push("animated_button--active")
    }

    const buttonValue = (isLoading) ? (
        <BarLoader speedMultiplier={1.5} value={value}/>
    ) : (
        value
    )
    return (
        <button onClick={handleClick} className={classNames.join(" ")} disabled={isLoading}>
            {buttonValue}
        </button>
    );
}

export default AnimatedButton;
