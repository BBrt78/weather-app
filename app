import './App.css';
import {useState, useRef, useEffect, useReducer, createContext, useContext} from 'react';
import axios from "axios"

function App() {
    const [data, setData] = useState({});
    const [location, setLocation] = useState("");

    const url = `https://api.openweathermap.org/data/2.5/weather?q=${location}&units:imperial&appid=c670f1544497a38382a9a0869fb4e315`

    const searchLocation = (event) => {
        if (event.key === "Enter") {
            axios.get(url).then((response) => {
                setData(response.data)
                console.log(response.data)
        })
        setLocation("")
    }}

    return (
        <div className="container">
            <input 
                className="input" 
                type="text" 
                id="input" 
                placeholder="Enter Location" 
                value={location} 
                onChange={event => setLocation(event.target.value)}
                onKeyDown={searchLocation}/>
            
            <div className="city">{data.name ? <p className="city">{data.name}</p> : null}</div>
            <div className="temperature">{data.main ? <p className="temperature">{data.main.temp}</p> : null}</div>
            <div className="description">{data.main ? <p className="description">{data.weather[0].description}</p> : null}</div>

            {data.main ? 
                <div className="bottom">
                    <div className="data feels">{data.main ? <p>{data.main.feels_like}</p> : null}Feels</div>
                    <div className="data humidity">{data.main ? <p>{data.main.humidity}</p> : null}Humidity</div>
                    <div className="data wind">{data.wind ? <p>{data.wind.speed}</p> : null}Wind</div>
                </div>
                : null}
        </div>
    )
}
export default App;
