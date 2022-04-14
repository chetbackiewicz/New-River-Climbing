<template>
  <div class="route">
<<<<<<< HEAD
	<!-- <router-link v-bind:to="{ name: 'route-information', params: {areaName: $store.state.currentArea, cragName: crag.name, routeName: route.name}}"> -->
      <button>{{route.name}} {{route.grade}} {{route.sport_trad}}</button>
	<!-- </router-link> -->
=======
      <button>{{route.route_name}} {{route.grade}} {{route.sport_trad}}</button>
>>>>>>> a9a09c049c3d90ee15c46beb568fc72a65223fcd
  </div>
</template>

<script>
export default {
  name: 'route-item',
  props: ['route'],
  methods: {
	// setRouteInformation() {
	// 	this.$store.commit('SET_ROUTE_INFO', this.route);
	// }
  }
}
</script>

<style>
.route {
	padding-left: 2rem;
	padding-right: 2rem;
}

button {
    display: inline-block;
    width: 100%;
    text-decoration: none;
	font-size: 1.1em;
	font-weight: bold;
	text-transform: uppercase;
	padding: 10px 15px;
	margin: 20px auto;
	color: #ccc;
	background-color: #555;
	background: -webkit-linear-gradient(#888, #555);
	background: linear-gradient(#888, #555);
	border: 0 none;
	border-radius: 5px;
	text-shadow: 0 -1px 0 #000;
	box-shadow: 0 1px 0 #666, 0 5px 0 #444, 0 6px 6px rgba(0,0,0,0.6);
	cursor: pointer;

}

button:hover, button:focus
{
	-webkit-animation: pulsate 1.2s linear infinite;
	animation: pulsate 1.2s linear infinite;
}

@-webkit-keyframes pulsate
{
	0%   { color: #ddd; text-shadow: 0 -1px 0 #000; }
	50%  { color: #fff; text-shadow: 0 -1px 0 #444, 0 0 5px #ffd, 0 0 8px #fff; }
	100% { color: #ddd; text-shadow: 0 -1px 0 #000; }
}
		
@keyframes pulsate
{
	0%   { color: #ddd; text-shadow: 0 -1px 0 #000; }
	50%  { color: #fff; text-shadow: 0 -1px 0 #444, 0 0 5px #ffd, 0 0 8px #fff; }
	100% { color: #ddd; text-shadow: 0 -1px 0 #000; }
}
</style>
