<template>
  <div id="area-comment-item">

      <h3>{{areaComment.username}}</h3>
      <h3>{{areaComment.comment}}</h3>
  </div>
</template>

<script>


export default {
    name: 'area-comment',
    props: ['areaComment']
}
</script>

<style>

</style>