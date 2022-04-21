<template>
  <div id="route-comment-list">
      <!-- <p v-if="areaComments.length === 0">No Comments</p> -->
      <!-- <area-comment-item v-else v-for="areaComment in areaComments" 
      v-bind:key="areaComment.id" v-bind:areaComment="areaComment"/> -->
        <h2>Comments</h2>
        <div class="comment" v-for="comment in routeComments" v-bind:key="comment.route_comment_id">
            <h3 id="comment">{{comment.comment}}</h3>
            <h5 class="tdbreak" id="username">-{{comment.username}}</h5>
        </div>
  </div>
</template>

<script>

export default {
    name: 'route-comments',
    data() {
        return {
            routeComments: []
        };
    },
    created() {
        this.routeComments = this.$store.state.routeComments
    }
}
</script>

<style>

.tdbreak {
  word-break: break-all
}

#route-comments-list {
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

#username {
    /* margin-left: 2rem; */
}

</style>