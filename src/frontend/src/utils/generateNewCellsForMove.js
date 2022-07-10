function generateNewCellsForMove(cells, origin, destination) {
    const newCells = JSON.parse(JSON.stringify(cells))

    newCells[destination].unit = newCells[origin].unit
    newCells[origin].unit = {moves: [], value: 0, white: false}

    newCells.forEach(cell => {
        cell.unit.moves = []
        cell.probability.value = 0
    })
    return newCells
}

export default generateNewCellsForMove;
