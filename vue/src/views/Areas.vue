<template>
  <div id="areas">
    <header>
      <h1>Welcome to the New River Gorge Guide</h1>
      <!-- Using a local computed property -->
      <!-- <router-link v-if="isAdmin" v-bind:to="{ name:'area-add'}" tag="button" >Add Area</router-link> -->
      
      <!-- Using a VueX getter -->
      <!-- <router-link v-if="$store.getters.isAdmin" v-bind:to="{ name:'product-add'}" tag="button" >Add Product</router-link> -->
    </header>
    <main>
      <h2>Areas</h2>
       <p class="description">The greater New River Gorge region is one of the East's largest, most diverse, and highest quality climbing areas. Between the three major river gorges- the New, the Gauley/Summersville, and the Meadow- there are over 3,000 established routes on 60+ miles of cliffline, as well as hundreds of established boulder problems. While the moderates at some crags (Bubba City, Summersville) can be extremely crowded on weekends, it is still possible to find solitude and even first ascents, whether you wish to climb sport, trad, or boulder.

The rock is Nuttall Sandstone; some of the oldest and most bullet-hard sedimentary rock in the world. It is similar to that of the Obed or Chattanooga region in TN, and much harder and less featured than that of the Red River Gorge. Cliffs range from 40 to 150 feet in height. Tiered roofs, technical faces, arêtes, and dihedrals are common, and there are excellent splitter cracks and technical slabs as well. The cliffs are very long with few breakdowns, and for this reason, many crags (Endless Wall, Summersville, Bubba City) are accessed via ladder, which can be a concern for dog owners. 

The New River Gorge is not a beginner's climbing mecca. Particularly in relation to the more popular Red River Gorge, the New's bolts tend to be farther apart, the holds smaller and more sparse, and the routes more technical and devious. Especially at Endless Wall, some sport routes may require a few pieces of gear to be led safely. The few crags with close bolting and concentrated 5.9s and 5.10s like Sandstonia, Butcher's Branch, and Orange Oswald can unsurprisingly get very crowded on weekends. To get the best experience at the quality crags, one should be solid on at least 5.11 sport and 5.10 trad.

Although locals climb at the New year-round, spring and fall are the best seasons, and even during these times, it is not uncommon to get hosed with week-long rain storms. Summers can be very hot and humid, but the crags of Summersville Lake can remain breezy, shady, and with swimming only minutes away. Winter climbing is feasible on south-facing crags on sunny days, but for the most part, it is not a good idea to plan a long trip here after Thanksgiving or before Spring Break.

If you happen to leave anything at the crag then please contact Water Stone Outdoors at (304) 574-2425.</p>
      <p class="directions">Located in and around Fayetteville, WV</p>
      <!-- <img src="https://aceraft.com/wp-content/uploads/2019/09/19-ACEblog-Fall-Adventures-NRG-1567x1024.jpg"> -->
      <area-list class="list"/>
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
        
    }
}
</script>

<style>



h1 {
  font-family: 'Courier New', Courier, monospace;
  font-weight: 100px;
  text-align: center;
}

main {
  display: grid;
  grid-template-areas: 
  "areas description"
  "list directions";
  
  grid-template-columns: 1fr 2fr;
}

.description {
  grid-area: description;
}

.directions {
  grid-area: directions;
}

h2 {
  display: flex;
  grid-area: areas;
  justify-content: center;
}

.list {
  grid-area: list;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

/* img {
  grid-area: img;
  max-width: 100%;
} */

  /* display: flex;
  border: 3px slategray solid;
  justify-content: center;
  flex-direction: column; */

</style>