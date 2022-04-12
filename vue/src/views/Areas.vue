<template>
  <div id="areas">
    <header>
      <h1>
        <img id="bridge" src="@/assets/cropped-bridge-icon.jpg" >
        Welcome to the New River Gorge Guide
        <img id="bridge" src="@/assets/cropped-bridge-icon.jpg" >
        </h1>
      <h2>Areas</h2>
      <!-- Using a local computed property -->
      <!-- <router-link v-if="isAdmin" v-bind:to="{ name:'area-add'}" tag="button" >Add Area</router-link> -->
      
      <!-- Using a VueX getter -->
      <!-- <router-link v-if="$store.getters.isAdmin" v-bind:to="{ name:'product-add'}" tag="button" >Add Product</router-link> -->
    </header>
    
    <main>
      <h3>About the New River Gorge</h3>
       <p class="description"> The greater New River Gorge region is one of the East's largest, most diverse, and highest quality climbing areas. Between the three major river gorges- the New, the Gauley/Summersville, and the Meadow- there are over 3,000 established routes on 60+ miles of cliffline, as well as hundreds of established boulder problems. While the moderates at some crags (Bubba City, Summersville) can be extremely crowded on weekends, it is still possible to find solitude and even first ascents, whether you wish to climb sport, trad, or boulder.

</p><p class="description">The rock is Nuttall Sandstone; some of the oldest and most bullet-hard sedimentary rock in the world. It is similar to that of the Obed or Chattanooga region in TN, and much harder and less featured than that of the Red River Gorge. Cliffs range from 40 to 150 feet in height. Tiered roofs, technical faces, arêtes, and dihedrals are common, and there are excellent splitter cracks and technical slabs as well. The cliffs are very long with few breakdowns, and for this reason, many crags (Endless Wall, Summersville, Bubba City) are accessed via ladder, which can be a concern for dog owners. 

</p><p class="description">The New River Gorge is not a beginner's climbing mecca. Particularly in relation to the more popular Red River Gorge, the New's bolts tend to be farther apart, the holds smaller and more sparse, and the routes more technical and devious. Especially at Endless Wall, some sport routes may require a few pieces of gear to be led safely. The few crags with close bolting and concentrated 5.9s and 5.10s like Sandstonia, Butcher's Branch, and Orange Oswald can unsurprisingly get very crowded on weekends. To get the best experience at the quality crags, one should be solid on at least 5.11 sport and 5.10 trad.

Although locals climb at the New year-round, spring and fall are the best seasons, and even during these times, it is not uncommon to get hosed with week-long rain storms. Summers can be very hot and humid, but the crags of Summersville Lake can remain breezy, shady, and with swimming only minutes away. Winter climbing is feasible on south-facing crags on sunny days, but for the most part, it is not a good idea to plan a long trip here after Thanksgiving or before Spring Break.

If you happen to leave anything at the crag then please contact Water Stone Outdoors at (304) 574-2425.</p>
      <h3>Directions</h3>
      <p class="directions">Located in and around Fayetteville, WV</p>
      <p class="instructions">Click your desired area to see description, directions, and available crags in the area.</p>
      <area-list />
    </main>
  </div>
</template>

<script>
import AreaList from "@/components/AreaList"
import areaService from "@/services/AreaService"

export default {
    name: 'areas',
    components: {
        AreaList,
    },
    created() {
        areaService.getAllAreas()
        .then(response => {
            if (response.status === 200) {
                this.$store.commit('SET_AREAS', response.data)
            }
        })
        .catch(error => {
         if (error.response) {
           this.errorMsg = `Error returned from server.  Recieved ${error.response.status} ${error.response.statusText}`;
         }
         else if (error.request) {
           this.errorMsg = 'Unable to connect to server';
         }
         else {
           this.errorMsg = 'Unknown error';
         }
       });
    }
}
</script>

<style>

body{
margin: 0;
padding: 0;
}

header {
  display: flex;
  background-color: rgb(228, 166, 104);
  justify-content: center;
  flex-direction: column;
}

#bridge {
  width: 6rem;
  height: 3.2rem;
}

h1 {
  display: flex;
  font-family: 'Courier New', Courier, monospace;
  justify-content: center;
  font-weight: bold;
}

h2 {
  background-color: rgb(228, 166, 104);
  padding-left: 2rem;
  font-size: 2.4rem;
}

h3 {
  padding-left: 2rem;
}

p {
  padding-left: 2rem;
  padding-right: 2rem;
}

.description {
  text-indent: 2%;
}

.directions {
  text-indent: 2%;
}

.instructions {
  padding-top: 1.5rem;
  text-align: center;
}




</style>