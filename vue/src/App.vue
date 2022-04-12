<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'areas'}">All Areas</router-link>
    </div>
    <router-view />
    <footer>
      <p>The New River Gorge Climbing Guide</p>
    </footer>
  </div>
</template>


<style>

#nav {
  background-color: rgb(228, 166, 104);;
  
}

footer {
  padding: 10px;
  margin-top: 20px;
  background-color: rgb(228, 166, 104);
  border-width: 2px;
  border-color: black;
}

</style>