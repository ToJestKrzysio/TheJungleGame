import {useState} from "react";

function useToggleState(initialState = false) {
    const [state, setState] = useState(Boolean(initialState));

    return [state, () => setState(prevState => !prevState)]
}

export default useToggleState;
