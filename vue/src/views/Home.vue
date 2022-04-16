<template>
  <div class="home">
    <h1>New River Gorge Guide Home</h1>
    <weather-forecast />
  </div>
</template>

<script>
import WeatherForecast from '@/components/WeatherForecast'

export default {
  name: "home",
  components: {
    WeatherForecast
  },
  async created() {
    const response = await fetch("https://api.openweathermap.org/data/2.5/onecall?lat=37.8756699&lon=-81.0775981&exclude=hourly,minutely,alerts&units=imperial&appid=6552a8974c91aa8d49b6f50421a35530")
    const weatherInfo = await response.json();
    this.$store.commit('SET_WEATHER_INFO', weatherInfo)
  }
};
</script>


