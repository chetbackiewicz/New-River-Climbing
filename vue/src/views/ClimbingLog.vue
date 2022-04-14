<template>
  <div id="climbing-log">
      <header>
          Climbing Log
      </header>
  
    <main>
        <h3>Your Climbs</h3>
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

</style>