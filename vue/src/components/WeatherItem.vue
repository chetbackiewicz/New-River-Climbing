<template>
  <div class="daily-weather">
      <div class="info">
        <div id="icon">
          <img id="weatherImg" :src=getIcon />
      </div>
      <div id="forecast">
          {{daily.weather[0].description}}<br>
      </div>
      <div id="high-temp">
          High: {{getRoundedTemp(daily.temp.max)}}°F
      </div>
      <div id="low-temp">
          Low: {{getRoundedTemp(daily.temp.min)}}°F
      </div>
      </div>
  </div>
</template>

<script>
export default {
    name: 'daily',
    props: ['daily'],
    methods: {
        getRoundedTemp(temp) {
            return Math.round(temp);
        }
    },
    computed: {
        getIcon() {
            return `http://openweathermap.org/img/wn/${this.daily.weather[0].icon}@2x.png`
        }
    }
}
</script>

<style>
.daily-weather {
    border: 1px solid #ccc;
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