import "./BoardBackground.scss"

import BoardBackgroundCell from "../BoardBackgroundCell/BoardBackgroundCell";


function BoardBackground() {
    const water = [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
    ]

    const cells = water.flat(1).map(
        (isWater, index) => (
            <BoardBackgroundCell isWater={isWater} light={index % 2} key={index}/>
        )
    );

    return (
        <div className="board_background">
            {cells}
        </div>
    );
}

export default BoardBackground;
