import React from 'react';

import './App.scss';

import Home from "./components/Home/Home";

function App() {
    return (
        <div className="App">
            <React.StrictMode>
                <Home />
            </React.StrictMode>
        </div>
    );
}

export default App;
