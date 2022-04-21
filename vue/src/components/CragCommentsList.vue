<template>
  <div id="crag-comment-list">
      <!-- <p v-if="areaComments.length === 0">No Comments</p> -->
      <!-- <area-comment-item v-else v-for="areaComment in areaComments" 
      v-bind:key="areaComment.id" v-bind:areaComment="areaComment"/> -->
        <h2>Comments</h2>
        <div class="comment" v-for="comment in cragComments" v-bind:key="comment.crag_comment_id">
            <h3 id="comment">{{comment.comment}}</h3>
            <h5 class="tdbreak" id="username">-{{comment.username}}</h5>
        </div>
  </div>
</template>

<script>

export default {
    name: 'crag-comments',
    data() {
        return {
            cragComments: []
        };
    },
    created() {
        this.cragComments = this.$store.state.cragComments
    }
}
</script>

<style>

.tdbreak {
  word-break: break-all
}

#crag-comments-list {
    width: 80%;
}

.comment {
    width:70vw;
    padding:20px;
    background:#fff;
    box-shadow: -3px -3px 7px rgba(94, 104, 121, 0.377),
              3px 3px 7px rgba(94, 104, 121, 0.377);
}

#comment {
    margin-bottom: 1rem;
    padding-left: 0%;
}


</style>