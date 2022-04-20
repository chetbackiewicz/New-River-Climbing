<template>
  <div class="activity-log">
      <p v-if="logList.length == 0">No climbs logged yet</p>
      <table v-else id = "log-table">
          <thead>
              <tr>
                  <th>UnSend</th>
                  <th>Route Name</th>
                  <th>Crag Name</th>
                  <th>Area Name</th>
                  <th>Attempts</th>
                  <th>Date Sent</th>
                  <th>Comments</th>
              </tr>
          </thead>
          <tbody>
              <tr v-for="log in logList" v-bind:key="log.activity_log_id">
                <td>
                <button id="delete" v-on:click="deleteFromLog(log.activity_log_id)">Delete</button>
                </td>
                <td>{{log.route_name}}</td>
                <td>{{log.crag_name}}</td>
                <td>{{log.area_name}}</td>
                <td>{{log.attempts}}</td>
                <td>{{log.date_sent}}</td>
                <td class="tdbreak">{{log.route_comments}}</td>
              </tr>
          </tbody>
      </table>
  </div>
</template>

<script>
import activityLogService from '@/services/ActivityLogService'

export default {
    name: 'log-list',
    computed: {
        logList() {
            const activityLog = this.$store.state.activityLog;
            return activityLog;
        }
    },
    methods: {
      deleteFromLog(id) {
        activityLogService.deleteActivity(id)
        window.location.reload()
      }
    }
}
</script>

<style>

#delete {
  border: none;
  color: black;
  border-radius: 15px;
  padding: 8px 16px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border: 1px solid grey;
}


#delete:hover {
  background-color: rgb(126, 5, 5);
  color: white;
}

.tdbreak {
  word-break: break-all
}

.activity-log {
    display: flex;
    justify-content: center;
}

table {
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  width: 80%;
  border-collapse: collapse;
  border: 3px solid skyblue;
  margin: 10px 10px 0 10px;
}

table th {
  text-transform: uppercase;
  text-align: left;
  background: skyblue;
  color: black;
  padding: 8px;
  min-width: 30px;
}

table td {
  text-align: left;
  padding: 8px;
  border-right: 2px solid skyblue;
}
table td:last-child {
  border-right: none;
}
table tbody tr:nth-child(2n) td {
  background: rgb(207, 241, 255);
}
</style>