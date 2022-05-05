import "./ModelSelect.scss"
import {useEffect, useState} from "react";
import {getModels, postModels} from "../../utils/helpers";
import useVersion from "../../hooks/useVersion";

function ModelSelect() {
    const [selectedModel, setSelectedModel] = useState("");
    const [selectedVersion, setSelectedVersion] = useState("");
    const [models, setModels] = useState([]);
    const [versions] = useVersion(selectedModel, setSelectedVersion);

    useEffect(() => {
        getModels()
            .then(data => {
                setModels(data)
                setSelectedModel(data[0])
            })
            .catch(err => console.log(err))
    }, [])

    function handleModelChange(event) {
        setSelectedModel(event.target.value)
    }

    function handleVersionChange(event) {
        setSelectedVersion(event.target.value)
    }

    function handleSubmit(event) {
        event.preventDefault()
        postModels(selectedModel, selectedVersion)
            .then(data => console.log(data.message))
            .catch(err => console.log(err))
    }

    const modelOptions = models.map((model) => <option value={model} key={model}>{model}</option>)
    const modelVersions = versions.map((version) => <option value={version} key={version}>V{version}.0</option>)

    return (
        <form action="" onSubmit={handleSubmit}>
            <label htmlFor="model_name">Model Name</label>
            <select name="Models" id="model_name" onChange={handleModelChange} onBlur={handleModelChange}>
                {modelOptions}
            </select>
            <label htmlFor="model_version">Model Version</label>
            <select name="Versions" id="model_version" onChange={handleVersionChange} onBlur={handleVersionChange} value={selectedVersion}>
                {modelVersions}
            </select>
            <button type="submit">Switch Model</button>
        </form>
    );
}

export default ModelSelect;
