<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'areas'}">Areas</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'climbing-log', params: {userId: $store.state.user.id}}">MyClimbs</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'search'}">Find Routes</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
    </div>
    <router-view />
    <footer>
      <p id="footer-text">The New River Gorge Climbing Guide</p>
    </footer>
  </div>
</template>

<style>

div #nav {
  display: flex;
  justify-content: space-evenly;
  padding: 1rem 0rem 1rem 0rem;
  background-color: #659dbd;
  font-size: 1rem;
  font-weight: bold;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

#nav:link {
  text-decoration: none;
}

a:link {
  text-decoration: none;
  color: #fbeec1;
}

a:visited {
  text-decoration: none;
  color: #fbeec1;
}


footer {
  background-color: #659dbd;
  color: #fbeec1;
  border-width: 2px;
  border-color: black;
  width: 100%;
  position: relative;
  bottom: 0;
}

#footer-text {
  padding: 40px;
}

</style>
