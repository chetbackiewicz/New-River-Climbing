<template>
  <div class="crag-info">
      <header>
          <h1 class="crag-name">
              {{$store.state.cragInfo.crag_name}}
          </h1>
      </header>
      <h3>
          Description
      </h3>
      <p>
          {{$store.state.areaInfo.description}}
      </p>
      <h3>
          Directions
      </h3>
      <p>
          {{$store.state.areaInfo.directions}}
      </p>
      <div>
          <h3>List of Routes</h3>
          <route-list />
      </div>
  </div>
</template>

<script>

import RouteList from '@/components/RouteList'
import routeService from '@/services/RouteService'

export default {
    name: 'crag-information',
    components: {
        RouteList
    },
    created() {
        const areaName = this.$route.params.areaName;
        const cragName = this.$route.params.cragName;
        routeService.getRoutesByCragName(areaName, cragName)
        .then(response => {
            this.$store.commit('SET_ROUTES', response.data);
        })
    }
}
</script>

<style>

</style>