import "./EvaluationsSelect.scss"
import {useEffect, useState} from "react";
import {getEvaluations, postEvaluations} from "../../utils/helpers";
import AnimatedButton from "../AnimatedButton/AnimatedButton";

function EvaluationsSelect() {
    const minEvaluations = 50
    const [evaluations, setEvaluations] = useState(minEvaluations)
    const [loading, setLoading] = useState(false)

    useEffect(() => {
        getEvaluations()
            .then(data => setEvaluations(data.value))
            .catch(err => console.log(err))
    }, [])

    function handleChange(event) {
        setEvaluations(event.target.value)
    }

    function handleOnClick() {
        setLoading(true)
        postEvaluations(evaluations)
            .then(data => console.log(data.message))
            .catch(err => console.log(err))
            .finally(() => setLoading(false))
    }

    function handleMinCheck() {
        setEvaluations(Math.max(minEvaluations, evaluations))
    }

    function handleKeyUp(event) {
        if (event.key === "Enter") {
            handleMinCheck()
        }
    }

    const inputClassNames = ['evaluation_select__input']
    if (evaluations < minEvaluations) {
        inputClassNames.push("evaluation_select__input--invalid")
    }


    return (
        <div className="evaluation_select">
            <label htmlFor="evaluation_select_input" className="evaluation_select__label">
                Searches per move
            </label>
            <input
                type="number"
                id="evaluation_select_input"
                className={inputClassNames.join(" ")}
                value={evaluations}
                onChange={handleChange}
                onBlur={handleMinCheck}
                onKeyUp={handleKeyUp}
            />
            <AnimatedButton onClick={handleOnClick} isLoading={loading} value="Submit"/>
        </div>
    );
}

export default EvaluationsSelect;
