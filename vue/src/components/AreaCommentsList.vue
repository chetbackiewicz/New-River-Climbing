<template>
  <div id="area-comment-list">
      <p v-if="areaComments.length === 0">No Comments</p>
      <!-- <area-comment-item v-else v-for="areaComment in areaComments" 
      v-bind:key="areaComment.id" v-bind:areaComment="areaComment"/> -->
        <h2>Comments</h2>
        <div class="comment" v-for="comment in areaComments" v-bind:key="comment.area_comment_id">
            <h3 id="username">{{comment.comment}}</h3>
            <h5 class="tdbreak" id="userComment">-{{comment.username}}</h5>
        </div>
  </div>
</template>

<script>

export default {
    name: 'area-comments',
    data() {
        return {
            areaComments: []
        };
    },
    created() {
        this.areaComments = this.$store.state.areaComments
    }
}
</script>

<style>

.tdbreak {
  word-break: break-all
}

#area-comments-list {
    width: 80%;
}

.comment {
    width:70vw;
    padding:20px;
    background:#fff;
    box-shadow: -3px -3px 7px rgba(94, 104, 121, 0.377),
              3px 3px 7px rgba(94, 104, 121, 0.377);
}

</style>