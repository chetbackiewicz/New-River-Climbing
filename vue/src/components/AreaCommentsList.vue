<template>
  <div id="area-comment-list">
      <p v-if="areaComments.length === 0">No Comments</p>
      <area-comment-item v-else v-for="areaComment in areaComments" 
      v-bind:key="areaComment.id" v-bind:areaComment="areaComment"/>
  </div>
</template>

<script>
import AreaCommentItem from '@/components/AreaCommentItem.vue';

export default {
    name: 'area-comments',
    components: {
        AreaCommentItem
    },
    data() {
        return {areaComments: this.$store.state.areaComments};
    },
    created() {
        console.log('we made it here');
    }
}
</script>

<style>

</style>