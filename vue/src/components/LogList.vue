<template>
  <div class="activity-log">
      <p v-if="logList.length == 0">No climbs logged yet</p>
      <table v-else id = "log-table">
          <thead>
              <tr>
                  <th>Route Name</th>
                  <th>Crag Name</th>
                  <th>Area Name</th>
                  <th>Date Sent</th>
                  <th>Comments</th>
              </tr>
          </thead>
          <tbody>
              <tr v-for="log in logList" v-bind:key="log.activity_log_id">
                <td>{{log.route_name}}</td>
                <td>{{log.crag_name}}</td>
                <td>{{log.area_name}}</td>
                <td>{{log.date_sent}}</td>
                <td>{{log.route_comments}}</td>
              </tr>
          </tbody>
      </table>
  </div>
</template>

<script>

export default {
    name: 'log-list',
    computed: {
        logList() {
            const activityLog = this.$store.state.activityLog;
            return activityLog;
        }
    }
}
</script>

<style>
table {
  font-family: 'Open Sans', sans-serif;
  width: 750px;
  border-collapse: collapse;
  border: 3px solid #44475C;
  margin: 10px 10px 0 10px;
}

table th {
  text-transform: uppercase;
  text-align: left;
  background: #44475C;
  color: #FFF;
  padding: 8px;
  min-width: 30px;
}

table td {
  text-align: left;
  padding: 8px;
  border-right: 2px solid #7D82A8;
}
table td:last-child {
  border-right: none;
}
table tbody tr:nth-child(2n) td {
  background: #D4D8F9;
}
</style>