<template>
  <div class="home">
    <header id="homepage-header">
      <div class="vid-message">
        <video autoplay muted loop id="myVideo">
        <source v-bind:src="require('../assets/crouch.mp4')" type="video/mp4">
      </video>
      <h1 id="home-header-text">
          Welcome to the New River Gorge Guide
      </h1>
      <router-link class="search-routes-button" v-bind:to="{ name: 'search'}">
        <button>
			<h3 id="find-routes">
				<b>Find Routes</b>
			</h3>
        </button>
      </router-link>
      </div>
      <!-- Using a local computed property -->
      <!-- <router-link v-if="isAdmin" v-bind:to="{ name:'area-add'}" tag="button" >Add Area</router-link> -->
      
      <!-- Using a VueX getter -->
      <!-- <router-link v-if="$store.getters.isAdmin" v-bind:to="{ name:'product-add'}" tag="button" >Add Product</router-link> -->
    </header>

    <main>
      <div id="about-section">
      <div class="about-header">
        <img id="bridge" src="@/assets/cropped-bridge-icon.jpg" >
        <h1 id="about-header">About the New River Gorge</h1>
        <img id="bridge" src="@/assets/cropped-bridge-icon.jpg" >
      </div>
       <p id="description"> The greater New River Gorge region is one of the East's largest, most diverse, and highest quality climbing areas. Between the three major river gorges- the New, the Gauley/Summersville, and the Meadow- there are over 3,000 established routes on 60+ miles of cliffline, as well as hundreds of established boulder problems. While the moderates at some crags (Bubba City, Summersville) can be extremely crowded on weekends, it is still possible to find solitude and even first ascents, whether you wish to climb sport, trad, or boulder.

</p><p id="description">The rock is Nuttall Sandstone; some of the oldest and most bullet-hard sedimentary rock in the world. It is similar to that of the Obed or Chattanooga region in TN, and much harder and less featured than that of the Red River Gorge. Cliffs range from 40 to 150 feet in height. Tiered roofs, technical faces, arêtes, and dihedrals are common, and there are excellent splitter cracks and technical slabs as well. The cliffs are very long with few breakdowns, and for this reason, many crags (Endless Wall, Summersville, Bubba City) are accessed via ladder, which can be a concern for dog owners. 

</p><p id="description">The New River Gorge is not a beginner's climbing mecca. Particularly in relation to the more popular Red River Gorge, the New's bolts tend to be farther apart, the holds smaller and more sparse, and the routes more technical and devious. Especially at Endless Wall, some sport routes may require a few pieces of gear to be led safely. The few crags with close bolting and concentrated 5.9s and 5.10s like Sandstonia, Butcher's Branch, and Orange Oswald can unsurprisingly get very crowded on weekends. To get the best experience at the quality crags, one should be solid on at least 5.11 sport and 5.10 trad.

Although locals climb at the New year-round, spring and fall are the best seasons, and even during these times, it is not uncommon to get hosed with week-long rain storms. Summers can be very hot and humid, but the crags of Summersville Lake can remain breezy, shady, and with swimming only minutes away. Winter climbing is feasible on south-facing crags on sunny days, but for the most part, it is not a good idea to plan a long trip here after Thanksgiving or before Spring Break.

If you happen to leave anything at the crag then please contact Water Stone Outdoors at (304) 574-2425.</p>
      </div>
    <h1 id="weather-header">Weather</h1>
    <weather-forecast v-if="isLoaded" />
    <h1 v-else>Waiting for weather...</h1>
    <h1 id="directions-header">Directions</h1>
    <div id="map">
      <iframe src="https://www.google.com/maps/d/embed?mid=1vEtPPeF_gw3tBivLNxUV2ALDUZjhx7pf&ehbc=2E312F" width="640" height="480"></iframe>
    </div>
    </main>
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

#find-routes {
  position: absolute;
  top: 600px;
  left: 44%;
  border: none;
  color: black;
  background-color: white;
  border-radius: 25px;
  padding: 32px 64px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  transition-duration: 0.4s;
  cursor: pointer;
}

#find-routes:hover {
  background-color: #008CBA;
  color: white;
}



#homepage-header {
  background: rgba(0, 0, 0, 0.5);
  display: flex;
}

.about-header {
  display: flex;
  margin-top: 3rem;
}

#myVideo {
  width: 100%;
  min-height: 40%;
  position: relative;
  top: 0;
  left: 0;
}

main {
  /* background-image: linear-gradient(#cacaca,#f1f1f1);  */
  background-color: #f1f1f1;
}

body {
height: 100vh;
margin: 0;
padding: 0;
position: relative;
}

/* header {
  display: flex;
  background-color: #659dbd;
} */
/* 
#welcome-header {
  display: inline-block;
} */

#bridge {
  width: 6rem;
  height: 3.3rem;
  padding-top: 1.5rem;
}

/* #welcome-message {
  position: fixed;
  top: 500px;
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  padding: 20px;
} */


#home-header-text {
  position: absolute;
  top: 500px;
  display: flex;
  justify-content: center;
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  width: 100%;
  padding-top: 50px;
  padding-bottom: 150px;
  margin: 0px;
}

#about-section {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

#description {
  display: block;
  max-width: 60%;
  padding-bottom: 1rem;
}

#weather-header {
  display: flex;
  justify-content: center;
}


#map {
  display: flex;
  margin-top: 3rem;
  padding-bottom: 3rem;
  justify-content: center;
  padding-bottom: 200px;
}

iframe {
  border-radius: 25px;
}

#directions-header {
  text-align: center;
}

</style>
