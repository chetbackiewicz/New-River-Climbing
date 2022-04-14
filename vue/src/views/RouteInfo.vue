<template>
  <div class = "route-info">
      <header>
        <h1 class="route-name">
          {{$store.state.routeInfo.name}}
        </h1>
      </header>
        <h3>
          Description
        </h3>
        <p>
          {{$store.state.routeInfo.description}}
        </p>
  </div>
</template>

<script>


export default {
 
}
</script>

<style>

</style>