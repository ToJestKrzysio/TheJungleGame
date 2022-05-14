import "./GameOver.scss"

function GameOver({game_over}) {
    if (game_over === 0) return ""

    return (
        <div className="game_over">
            <h1>{game_over > 0 ? "White" : "Black"} Player Won</h1>
        </div>
    );
}

export default GameOver;
