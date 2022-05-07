import "./BarLoader.scss"

function BarLoader(
    {
        // width = 100,
        height = 6,
        speedMultiplier = 1,
        value
    }
) {
    const animationSpeed = 2 / speedMultiplier
    const loaderStyle = {
        height,
    }
    const sliderStyle = {
        animation: `loadingBar ${animationSpeed}s linear infinite`
    }
    return (
        <div className="loader" style={loaderStyle}>
            {value}
            <div className="loader__bar" style={sliderStyle}/>
        </div>
    );
}

export default BarLoader;
