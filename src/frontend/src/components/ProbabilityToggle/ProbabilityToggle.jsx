import "./ProbabilityToggle.scss"

function ProbabilityToggle({visible, toggleVisible}) {

    const button_text = visible ? "Hide Probabilities" : "Show Probabilities"
    const classNames = visible ? "toggle_button toggle_button--on" : "toggle_button toggle_button--off"
    return (
        <div className="model_form">
            <label htmlFor="toggle_probabilities" className="" hidden={true}/>
            <button
                id="toggle_probabilities"
                className={classNames}
                onClick={toggleVisible}
                style={{"margin": 0}}
            >
                {button_text}
            </button>
        </div>

    );
}

export default ProbabilityToggle;
