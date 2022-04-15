<template>
  <div class = "route-info">
      <header>
        <h1 class="route-name">
          {{$store.state.routeInfo.route_name}} {{$store.state.routeInfo.grade}}
        </h1>
      </header>
      <div class="top-of-page-display">
        <div id="route-information">
          <div id="rating">
          <h3>
          Rating:
          <img class = "star-img" src="../assets/star.png" alt="Number of stars" v-for="star in numberOfStars" v-bind:key="star.id">
          </h3>
          </div>
          <div class="type">
            <h3>
            Type:
          </h3>
          <p v-if="$store.state.routeInfo.sport_trad == 'S'">Sport</p>
          <p v-else>Trad</p>
          </div>
          <div class="height">
            <h3>
            Height:
          </h3>
          <p>{{$store.state.routeInfo.height}} ft</p>
          </div>
          <div class="protection">
            <h3>Protection:</h3>
            <p class="bolts">{{$store.state.routeInfo.bolt_count}} bolts,</p>
            <p v-if="$store.state.routeInfo.has_anchors == true" class="anchors">bolt anchors</p>
            <p v-else>No Anchors</p>
          </div>
          <div class="route-description">
            <h3>
            Description 
          </h3>
          <p>{{$store.state.routeInfo.description}}</p>
          </div>
        </div>
        <div id="log-form">
          <log-form />
        </div>
      </div>
        <route-item />
  </div>
</template>

<script>

import RouteItem from '@/components/RouteItem'
import routeService from '@/services/RouteService'
import LogForm from '@/components/LogForm'

export default {
  name: 'route-information',
  components: {
    RouteItem,
    LogForm
  },
  computed: {
    numberOfStars() {
      return (this.$store.state.routeInfo.rating);
    }

  },
  created() {
    const areaName = this.$route.params.areaName;
    const cragName = this.$route.params.cragName;
    const routeName = this.$route.params.routeName;
    routeService.getRouteByRouteName(areaName, cragName, routeName)
    .then(response => {
      this.$store.commit('SET_ROUTE_INFO', response.data);
    })
  }
 
}
</script>

<style>

.top-of-page-display {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: 
  "route-information log-form";
}

#route-information {
  grid-area: route-information;
  padding-top: 2rem;
}

#log-form {
  grid-area: log-form;
  padding-top: 2rem;
}

.star-img {
  height: 1em;
}

.type {
  display: flex;
  align-items: baseline;
}

.type p {
  padding-left: 0.5em;
}

.height {
  display: flex;
  align-items: baseline;
}

.height p {
  padding-left: 0.5em;
}

.protection {
  display: flex;
  align-items: baseline;
}

.bolts {
  padding-right: 0.5em;
  padding-left: 0.5em;
}

.anchors {
  padding-left: 0em;
}

.route-description {
  display: block;
}





</style>