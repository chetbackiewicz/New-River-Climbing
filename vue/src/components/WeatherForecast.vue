<template>
  <div class="forecast">
      <!-- <current-weather v-bind="currentInfo"/> -->
        <div class="current-weather">
            <div id="icon">
                <img id="weatherImg" :src=getIcon />
            </div>
            <div id="description">
                Current: {{$store.state.weatherInfo.current.weather[0].description}}
            </div>
            <div id="current-temp">
                Temp: {{getRoundedTemp($store.state.weatherInfo.current.temp)}}°F
            </div>
            <div id="feels-like-temp">
                Feels Like: {{getRoundedTemp($store.state.weatherInfo.current.feels_like)}}°F
            </div>
        </div>
        <div class="future-weather">
            <weather-item v-for="daily in weatherInfo" v-bind:key="daily.id" v-bind:daily="daily"/>
        </div>
  </div>
</template>

<script>
import WeatherItem from '@/components/WeatherItem'
// import CurrentWeather from '@/components/CurrentWeather'

export default {
    name: 'forecast',
    components: {
        WeatherItem,
        // CurrentWeather
    },
    methods: {
        getRoundedTemp(temp) {
            return Math.round(temp);
        }
    },
    computed: {
        weatherInfo() {
            return this.$store.state.weatherInfo.daily;
        },
        currentInfo() {
            return this.$store.state.weatherInfo.current;
        },
        getIcon() {
            return `http://openweathermap.org/img/wn/${this.$store.state.weatherInfo.current.weather[0].icon}@2x.png`
        }
    }
}
</script>

<style>
.forecast {
    display: grid;
    grid-template-columns: 1fr;
    grid-template-areas: 
    "current-weather"
    "future-weather";
    justify-items: center;
}

.current-weather {
    grid-area: current-weather;
    /* border: 2px solid #ccc; */
    border-radius: 25px;
    margin: 5px;
    background-image: linear-gradient(skyblue, white);
    padding: 1rem;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    width: 15vw;
}

.future-weather {
    grid-area: future-weather;
    display: flex;
    justify-content: center;
}


</style>