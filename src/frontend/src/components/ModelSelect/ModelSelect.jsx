import "./ModelSelect.scss"
import {useState} from "react";

function ModelSelect() {
    const [models, setModels] = useState(["first_model", "model_2", "model_3", "model_4"])
    const [versions, setVersions] = useState([1, 2, 4, 5, 6])

    const modelOptions = models.map((model) => <option value={model}>{model}</option>)
    const modelVersions = versions.map((version) => <option value={version}>V{version}.0</option>)

    function handleSubmit(event) {
        event.preventDefault()
    }

    return (
        <form action="" onSubmit={handleSubmit}>
            <label htmlFor="ModelNameSelect">Model Name</label>
            <select name="Models" id="ModelNameSelect">
                {modelOptions}
            </select>
            <label htmlFor="ModelVersionSelect">Model Version</label>
            <select name="Versions" id="ModelVersionSelect">
                {modelVersions}
            </select>
            <button type="submit">Switch Model</button>
        </form>
    );
}

export default ModelSelect;
