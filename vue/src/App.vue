<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'areas'}">Areas</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'climbing-log', params: {userId: $store.state.user.id}}">MyClimbs</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
    </div>
    <router-view />
    <footer>
      <p>The New River Gorge Climbing Guide</p>
    </footer>
  </div>
</template>

<style>
div #nav {
  display: flex;
  justify-content: space-evenly;
  padding: 1rem 0rem 1rem 0rem;
  background-color: peru;
}

#nav:link {
  text-decoration: none;
}

a:link {
  text-decoration: none;
  color: white;
}

a:visited {
  text-decoration: none;
  color: white;
}


footer {
  padding: 10px;
  margin-top: 20px;
  background-color: rgb(228, 166, 104);
  border-width: 2px;
  border-color: black;
  width: 100%;
}

</style>
