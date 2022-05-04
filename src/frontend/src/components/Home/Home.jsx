import "./Home.scss"
import BoardBackground from "../BoardBackground/BoardBackground";
import ModelSelect from "../ModelSelect/ModelSelect";
import Board from "../Board/Board";

function Home() {
    return (
        <div className="Home">
            <div className="BoardColumn">
                <Board/>
            </div>
            <div className="NavigationColumn">
                <ModelSelect/>
            </div>
        </div>
    );
}

export default Home;
