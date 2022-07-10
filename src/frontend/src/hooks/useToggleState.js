import {useState} from "react";

function useToggleState(initialState = false) {
    const [state, setState] = useState(Boolean(initialState));

    function toggle(event, newState) {
        if (newState === undefined) {
            setState(!state)
        } else {
            setState(Boolean(newState))
        }
    }

    return [state, toggle]
}

export default useToggleState;
