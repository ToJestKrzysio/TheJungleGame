async function fetchBoardState() {
    const result = await fetch("/api/board")
    return await result.json()
}

async function postMove(origin_id, destination_id) {
    console.log(origin_id);
    console.log(destination_id);
    const data = JSON.stringify({origin: origin_id, destination: destination_id})
    console.log(data);
    const result = await fetch("/api/board", {
        method: "POST",
        headers: {'Content-Type': 'application/json'},
        body: data
    })
    return await result.json()
}

export {fetchBoardState, postMove};
