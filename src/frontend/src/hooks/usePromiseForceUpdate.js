import {useState} from "react";

function usePromiseForceUpdate () {
    
    const [update, setUpdate] = useState(false);

    function toggleUpdate() {
        setUpdate(!update);
    }

    return [update, toggleUpdate];
}

export default usePromiseForceUpdate;
