<template>
  <div class="crag">
      <router-link v-bind:to="{ name: 'crag-information', params: {areaName: $store.state.currentArea, cragName: crag.crag_name}}">
      <!-- <button id="button" v-on:click="setCragInformation()"> -->
	<div class="card" v-on:click="setCragInformation()">
			<img id="card-img" v-bind:src="require('../assets/crag-images/' + crag.crag_name + '.jpg')">
			<div class="container">
			<h4 id="crag-name">
				<b>{{crag.crag_name}}</b>
			</h4>
			</div>
		</div>
      </router-link>
  </div>
</template>

<script>
export default {
    name: 'crag-item',
    props: ['crag'],
    methods: {
        setCragInformation() {
            this.$store.commit('SET_CRAG_INFO', this.crag);        
			}
    }
}
</script>

<style>

.crag {
	display: inline-flex;
    flex-wrap: wrap;
	margin: 2rem;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40vw;
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

#crag-name {
	margin: 1rem;
	font-family: 'Lato', sans-serif;
    font-family: 'Poppins', sans-serif;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 12px 24px 0 rgba(0,0,0,0.2);
}

.container {
	display: flex;
	flex-direction: column;
	color: black;
	justify-content: left;
	text-align: center;
}

/* #button {
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

#button:hover, button:focus
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