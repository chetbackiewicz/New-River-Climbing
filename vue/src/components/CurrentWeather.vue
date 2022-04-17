<template>
  <div class="current-weather">
      <div class="info">
        <div id="icon">
          <img id="weatherImg" :src=getIcon />
      </div>
      <div id="forecast">
          {{current.weather[0].description}}<br>
      </div>
      <div id="current-temp">
          Current: {{getRoundedTemp(current.temp)}}°F
      </div>
      <div id="feels-like-temp">
          Feels Like: {{getRoundedTemp(current.feels_like)}}°F
      </div>
      </div>
  </div>
</template>

<script>
export default {
    name: 'current',
    props: ['current'],
    methods: {
        getRoundedTemp(temp) {
            return Math.round(temp);
        }
    },
    computed: {
        getIcon() {
            return `http://openweathermap.org/img/wn/${this.current.weather[0].icon}@2x.png`
        }
    }
}
</script>

<style>
.current-weather {
    border: 2px solid #ccc;
    border-radius: 25px;
    margin: 5px;
    background-image: linear-gradient(skyblue, white);
}

.info {
    padding: 1rem;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
}
</style>