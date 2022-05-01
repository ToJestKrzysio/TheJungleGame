async function fetchBoardState() {
    const result = await fetch("/api/board")
    return await result.json()
}

export {fetchBoardState};
