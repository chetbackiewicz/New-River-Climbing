<template>
  <div class="home">
    <h1>New River Gorge Guide Home</h1>
    <div  id="map">
      <iframe src="https://www.google.com/maps/d/embed?mid=1vEtPPeF_gw3tBivLNxUV2ALDUZjhx7pf&ehbc=2E312F" width="640" height="480"></iframe>
    </div>
  </div>
</template>

<script>

export default {
  name: "home",
};
</script>

<style>

#map {
  display: flex;
  padding-left: 1rem;
}

iframe {
  border-radius: 25px;
}





</style>