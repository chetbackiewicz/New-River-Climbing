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

</style>