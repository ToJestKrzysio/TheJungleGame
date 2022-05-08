import {useEffect, useState} from "react";

const localCache = {};

function useVersion(modelName, setSelectedVersion) {
    const [versions, setVersions] = useState([])

    useEffect(() => {
        requestVersionList()
            .catch(err => console.log(err));
    }, [modelName])

    async function requestVersionList() {
        if (!modelName) {
            setVersions([])
        } else if (localCache[versions]) {
            setVersions(localCache[versions])
            setSelectedVersion(localCache[modelName][0])
        } else {
            const response = await fetch(`/api/models/${modelName}`)
            const data = await response.json()
            localCache[modelName] = data.sort((a, b) => parseInt(b) - parseInt(a))
            setVersions(localCache[modelName])
            setSelectedVersion(localCache[modelName][0])
        }
    }

    return [versions]
}


export default useVersion;
