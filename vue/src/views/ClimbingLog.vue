<template>
  <div id="climbing-log">
      <header>
          <h1>
            Climbing Log
          </h1>
          <h3 id="your-climbs">Your Climbs</h3>
      </header>
  
    <main>
        <log-list />
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
</style>