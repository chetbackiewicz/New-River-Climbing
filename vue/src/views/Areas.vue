<template>
  <div id="areas">
      <h2 class="instructions">Click your desired area to see description, directions, and available crags in the area.</h2>
      <area-list />
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
width: 100%;
position: relative;
}

header {
  display: flex;
  background-color: #659dbd;
  justify-content: center;
  flex-direction: column;
}

h2 {
  padding-left: 2rem;
  padding-right: 2rem;
}

.instructions {
  padding-top: 1.5rem;
  text-align: center;
}




</style>