<template>
  <div id="climbing-log">
      <header>
          <h1 id="log-heading-text">
            Climbing Log
          </h1>
          <h3 id="your-climbs">Your Climbs</h3>
      </header>
  
    <main>
        <log-list id="log-list" />
    </main>
  </div>
</template>

<script>
import activityLogService from '@/services/ActivityLogService'
import LogList from '@/components/LogList'

export default {
    name: 'climbing-log',
    components: {
        LogList
    },
    created() {
        const userId = this.$route.params.userId;
        activityLogService.getActivityLogsByUserId(userId)
        .then(response => {

            this.$store.commit('SET_ACTIVITY_LOG', response.data);
        })
    }
}
</script>

<style>
#your-climbs {
    text-align: center;
}

#log-list {
    margin: 5rem;
}

#log-heading-text {
    background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  padding: 20px;
  margin: 0%;
}
</style>