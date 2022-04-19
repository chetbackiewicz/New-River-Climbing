<template>
  <div class="daily-weather">
      <div class="info">
        <div id="icon">
          <img id="weatherImg" :src=getIcon />
      </div>
      <div id="day">
          {{getDayOfWeek(daily.dt)}}
      </div>
      <div id="forecast">
          {{daily.weather[0].description}}<br>
      </div>
      <div id="high-temp">
          H: {{getRoundedTemp(daily.temp.max)}}°
      </div>
      <div id="low-temp">
          L: {{getRoundedTemp(daily.temp.min)}}°
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
        },
        getDayOfWeek(dt) {
            const date = new Date(dt*1000);
            return date.toLocaleString("en-US", {weekday: "long"});
        },
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
    /* border: 1px solid #ccc; */
    border-radius: 25px;
    margin: 5px;
    background-image: linear-gradient(skyblue, #f1f1f1);
}

.info {
    padding: 1rem;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
}
</style>