<template>
  <div id="areas">
    <header>
      <h1>Welcome to the New River Gorge Guide</h1>
      <h2>Areas</h2>
      <!-- Using a local computed property -->
      <!-- <router-link v-if="isAdmin" v-bind:to="{ name:'area-add'}" tag="button" >Add Area</router-link> -->
      
      <!-- Using a VueX getter -->
      <!-- <router-link v-if="$store.getters.isAdmin" v-bind:to="{ name:'product-add'}" tag="button" >Add Product</router-link> -->
    </header>
    
    <main>
      <p>Click your desired area to see description, directions, and available crags in the area.</p>
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
        
    }
}
</script>

<style>

header {
  display: flex;
  background-color: rgb(228, 166, 104);
  justify-content: center;
  flex-direction: column;
}

h1 {
  display: flex;
  justify-content: center;
  font-weight: bold;
}

h2 {
  background-color: rgb(228, 166, 104);
}

footer {
  padding: 10px;
  margin-top: 20px;
  background-color: rgb(228, 166, 104);
  border-width: 2px;
  border-color: black;
}




</style>