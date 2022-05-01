import "./Home.scss"
import BoardBackground from "../BoardBackground/BoardBackground";
import ModelSelect from "../ModelSelect/ModelSelect";

function Home() {
    return (
        <div className="Home">
            <div className="BoardColumn">
                <BoardBackground/>
            </div>
            <div className="NavigationColumn">
                <ModelSelect/>
            </div>
        </div>
    );
}

export default Home;
