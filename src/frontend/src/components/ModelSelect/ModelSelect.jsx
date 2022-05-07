import "./ModelSelect.scss"
import {useEffect, useState} from "react";
import {getModels, postModels} from "../../utils/helpers";
import useVersion from "../../hooks/useVersion";
import AnimatedButton from "../AnimatedButton/AnimatedButton";

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

    const modelNames = models.map((model) => (
            <option
                value={model}
                key={model}
                className="model_form__name--option">
                {model}
            </option>
        )
    )

    const modelVersions = versions.map((version) => (
            <option
                value={version}
                key={version}
                className="model_form__version--option">
                V{version}.0
            </option>
        )
    )

    return (
        <form action="" onSubmit={handleSubmit} className="model_form">
            <label
                htmlFor="model_name"
                className="model_form__name--label">
                Model Name
            </label>
            <select
                name="Models"
                id="model_name"
                onChange={handleModelChange}
                onBlur={handleModelChange}
                className="model_form__name--select">
                {modelNames}
            </select>

            <label
                htmlFor="model_version"
                className="model_form__version--label">
                Model Version
            </label>
            <select
                name="Versions"
                id="model_version"
                onChange={handleVersionChange}
                onBlur={handleVersionChange}
                value={selectedVersion}
                className="model_form__version--select">
                {modelVersions}
            </select>

            <AnimatedButton value="Switch Model"/>
        </form>
    );
}

export default ModelSelect;
