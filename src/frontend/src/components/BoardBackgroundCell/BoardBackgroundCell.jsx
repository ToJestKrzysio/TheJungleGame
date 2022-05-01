import "./BoardBackgroundCell.scss"

function BoardBackgroundCell({isWater, light}) {
    let classNames = "background_cell background_cell"
    classNames += isWater ? "__water" : "__land"
    classNames += light ? "--light" : "--dark"

    return (
        <div className={classNames}></div>
    );
}

export default BoardBackgroundCell;
