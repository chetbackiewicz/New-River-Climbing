<template>
  <div class="route">
	<router-link v-bind:to="{ name: 'route-info', params: {routeName: route.route_name}}">
      <!-- <button >{{route.route_name}} {{route.grade}} {{route.sport_trad}}</button> -->
	<div class="card">
		<img id="card-img" v-bind:src="require('../assets/route-images/' + route.route_name + '.jpg')">
		<div class="container">
			<h4>
				<b>{{route.route_name}}</b>
			</h4>
			<p v-if="route.sport_trad == 'S'">
				{{route.grade}} Sport
			</p>
			<p v-else>
				{{route.grade}} Trad
			</p>
		</div>
	</div>
	</router-link>
  </div>
</template>

<script>
export default {
  name: 'route-item',
  props: ['route']
}
</script>

<style>
.route {
	padding-left: 1rem;
	padding-right: 1rem;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 15vw;
  margin-bottom: 1rem;
border-radius: 25px;

}

#card-img {
	width: 100%; /* width of container */
    height: 150px; /* height of container */
    object-fit: cover;
	border-top-left-radius: 25px;
	border-top-right-radius: 25px;

}

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 12px 24px 0 rgba(0,0,0,0.2);
}

.container {
	display: flex;
	flex-direction: column;
	max-width: 15vw;
	color: black;
	justify-content: left;
	text-align: center;
}

h4 {
	padding-top: 3px;
	padding-bottom: 2px;
	margin: 1px;
}

p {
	margin: 1px;
	padding-bottom: 3px;
}

/* Add some padding inside the card container */

/* button {
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
} */
</style>
