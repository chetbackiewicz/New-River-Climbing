<template>
  <div class="log-form">
      <form v-on:submit.prevent="addLog">
          <div class="form-field">
              <label for="date-sent">Date Sent:</label>
              <Datepicker v-model="newLog.date_sent" format="yyyy-MM-dd"></Datepicker>
          </div>
          <div class="form-field">
              <label for="attempts">Attempts:</label>
              <input type="number" step="1" id="attempts" v-model.number="newLog.attempts">
          </div>
          <div class="form-field">
              <label for="comments">Comments:</label>
              <input type="text" id="comments" v-model.trim="newLog.route_comments">
          </div>
          <div class="form-field">
              <input type="submit" v-on:click="setLogInfo">
          </div>
        </form>
  </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker'
import activityLogService from '@/services/ActivityLogService'

export default {
    name: 'log-form',
    components: {
        Datepicker
    },
    data() {
        return {
            newLog: {
                user_id: null,
                route_id: null,
                date_sent:null,
            }
        }
    },
    methods: {
        addLog() {
            activityLogService.addActivityLog(this.newLog.user_id, this.newLog)
            .then(() => {
                alert("Added to MyClimbs")
                console.log(this.newLog)
                this.newLog = [];
            })
        },
        setLogInfo() {
            this.newLog.user_id = this.$store.state.user.id
            this.newLog.route_id = this.$store.state.routeInfo.route_id
        }
    }
    

}
</script>

<style>

</style>