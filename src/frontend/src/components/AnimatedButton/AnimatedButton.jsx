import "./AnimatedButton.scss"
import BarLoader from "../BarLoader/BarLoader";

function AnimatedButton({onClick: handleClick, isLoading, value, disabled = false}) {

    const classNames = ["animated_button"]

    const loadingOrDisabled = isLoading || disabled
    if (disabled) {
        classNames.push("animated_button--disabled")
    } else if (!isLoading) {
        classNames.push("animated_button--active")
    }

    const buttonValue = isLoading && !disabled ? <BarLoader speedMultiplier={1.5} value={value}/> : value

    return (
        <button onClick={handleClick} className={classNames.join(" ")} disabled={loadingOrDisabled}>
            {buttonValue}
        </button>
    );
}

export default AnimatedButton;
