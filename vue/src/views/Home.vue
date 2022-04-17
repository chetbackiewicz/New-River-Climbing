<template>
  <div class="home">
    <h1>New River Gorge Guide Home</h1>
    <weather-forecast v-if="isLoaded" />
    <h1 v-else>Waiting for weather...</h1>
    <div id="map">
      <iframe src="https://www.google.com/maps/d/embed?mid=1vEtPPeF_gw3tBivLNxUV2ALDUZjhx7pf&ehbc=2E312F" width="640" height="480"></iframe>
    </div>
  </div>
</template>

<script>
import WeatherForecast from '@/components/WeatherForecast'

export default {
  name: "home",
  components: {
    WeatherForecast
  },
  data() {
    return {
      weatherLoaded: false
    }
  },
  computed: {
    isLoaded() {
      return this.weatherLoaded;
    }
  },
  async created() {
    const response = await fetch("https://api.openweathermap.org/data/2.5/onecall?lat=37.8756699&lon=-81.0775981&exclude=hourly,minutely,alerts&units=imperial&appid=6552a8974c91aa8d49b6f50421a35530")
    const weatherInfo = await response.json();
    this.$store.commit('SET_WEATHER_INFO', weatherInfo)
    this.weatherLoaded = true;
  }
};
</script>

<style>

#map {
  display: flex;
  margin-top: 3rem;
  padding-left: 1rem;
  justify-content: center;
}

iframe {
  border-radius: 25px;
}





</style>
