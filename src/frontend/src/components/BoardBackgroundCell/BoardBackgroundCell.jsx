import "./BoardBackgroundCell.scss"

function BoardBackgroundCell({isWater, light, isTrap, trapWhite}) {
    let classNames = "background_cell background_cell"
    classNames += isWater ? "__water" : "__land"
    classNames += light ? "--light" : "--dark"
    classNames += trapWhite ? " background_cell--font_light" : " background_cell--font_dark"

    const value = Boolean(isTrap) && "X"

    return (
        <div className={classNames}>{value}</div>
    );
}

export default BoardBackgroundCell;
