<template>
  <div class="search-bar">
  </div>
</template>

<script>

export default {
    name: 'search',
    data() {
        return {
        search: ""
        };
    },
  computed: {
    filteredRoutes() {
      return this.routes.filter(p => {
        return p.name.toLowerCase().indexOf(this.search.toLowerCase()) != -1;
      });
    }
  },
  created: {
      this.routes = []
  }
}
</script>

<style>

</style>