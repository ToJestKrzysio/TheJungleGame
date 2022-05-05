async function fetchBoardState() {
    const result = await fetch("/api/board")
    return await result.json()
}

async function postMove(origin_id, destination_id) {
    const data = JSON.stringify({origin: origin_id, destination: destination_id})
    const response = await fetch("/api/board", {
        method: "POST",
        headers: {'Content-Type': 'application/json'},
        body: data
    })
    return await response.json()
}


async function getModels() {
    const response = await fetch("/api/models")
    return await response.json()
}


async function postModels(model, version) {
    const data = JSON.stringify({model, version})
    const response = await fetch("/api/models/", {
        method: "POST",
        headers: {'Content-Type': 'application/json'},
        body: data
    })
    return await response.json()
}


export {
    fetchBoardState,
    postMove,
    getModels,
    postModels
};
