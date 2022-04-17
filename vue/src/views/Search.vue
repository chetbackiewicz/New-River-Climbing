<template>
  <div class="search">
        <input id="search-bar" type="text" v-model="search" placeholder="Search" />
    <div class="route-list">
        <p v-if="routes.length == 0">No Routes Found</p>
      <route-item v-else v-for="item in filteredRoutes"
      v-bind:key="item.id" v-bind:route="item"/>
    </div>  
   </div>
</template>

<script>
import routeService from '@/services/RouteService'
import RouteItem from '@/components/RouteItem'

export default {
    name: 'search',
    components: {
        RouteItem
    },
    data() {
        return {
            routes: [],
            search: ""
        };
    },
  computed: {
    filteredRoutes() {
      return this.routes.filter(route => {
        const filtered = route.route_name.toLowerCase().indexOf(this.search.toLowerCase()) != -1;        return filtered;
      });
    }
  },
  created() {
    routeService.getAllRoutes()
    .then(response => {
        if (response.status == 200) {
            this.routes = response.data;
            console.log(this.routes)
        }
    })
  }
}
</script>

<style>
#search-bar {
    display: flex;
    justify-content: center;
    margin: 2rem auto;
    width: 45%;
    height: 3rem;
    border-radius: 25px;
    font-size: 20px;
    padding-left: 0.5rem;
}

#search-bar:hover {
    background-color: skyblue;
    color: black;
}

.route-list {
    display: inline-flex;
    flex-wrap: wrap;
    margin-left: 3rem;
    margin-right: 3rem;
}

</style>