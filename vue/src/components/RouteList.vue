<template>
  <div class="routes">
      <p v-if="routes.length == 0">No Routes Found</p>
      <route-item v-else v-for="item in routes"
      v-bind:key="item.id" v-bind:route="item"/>
  </div>
</template>

<script>

import RouteItem from '@/components/RouteItem';
export default {
  name: 'routes',
  components: {
    RouteItem
  },
  computed: {
    routes() {
      const routes = this.$store.state.routes;
      return routes;
    }
  }
}
</script>

<style>

</style>