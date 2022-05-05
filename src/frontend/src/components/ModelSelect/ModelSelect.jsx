import "./ModelSelect.scss"
import {useEffect, useState} from "react";
import {getModels} from "../../utils/helpers";

function ModelSelect() {
    const [models, setModels] = useState([]);
    const [versions, setVersions] = useState([]);
    const [modelsData, setModelsData] = useState([])
    const [selectedModel, setSelectedModel] = useState([]);
    // const [selectedVersion, setSelectedVersion] = useState([]);

    function handleSubmit(event) {
        event.preventDefault()
        console.log(event.target)
    }

    useEffect(() => {
        getModels()
            .then(data => {
                setVersions(data)
                const modelNames = []
                for (const modelName in data) {
                    modelNames.push(modelName)
                }
                setModels(modelNames)
            })
            .catch(err => console.log(err))
    }, [])

    const modelOptions = models.map((model) => <option value={model} key={model}>{model}</option>)
    const modelVersions = (versions[selectedModel] || []).map(
        (version) => <option value={version} key={version}>V{version}.0</option>)

    return (
        <form action="" onSubmit={handleSubmit}>
            <label htmlFor="model_name">Model Name</label>
            <select name="Models" id="model_name">
                {modelOptions}
            </select>
            <label htmlFor="model_version">Model Version</label>
            <select name="Versions" id="model_version">
                {modelVersions}
            </select>
            <button type="submit">Switch Model</button>
        </form>
    );
}

export default ModelSelect;
