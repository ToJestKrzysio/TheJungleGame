import "./ProbabilityToggle.scss"

function ProbabilityToggle({visible, toggleVisible}) {

    const button_text = visible ? "Hide" : "Show"
    const classNames = visible ? "toggle_button toggle_button--off" : "toggle_button toggle_button--on"
    return (
        <div className="model_form">
            <label htmlFor="toggle_probabilities" className="label_light">Probabilities</label>
            <button
                id="toggle_probabilities"
                className={classNames}
                onClick={toggleVisible}
                style={{"margin": "0px", "width": "75px"}}
            >
                {button_text}
            </button>
        </div>

    );
}

export default ProbabilityToggle;
