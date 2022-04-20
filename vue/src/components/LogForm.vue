<template>
  <div class="log-form">
      <form v-on:submit.prevent="addLog">
          <div id="form-title">Add To MyClimbs</div>
          <div class="form-field">
              <Datepicker id="date-sent" placeholder="Date First Sent" v-model="newLog.date_sent" format="yyyy-MM-dd"></Datepicker>
          </div>
          <div class="form-field">
              <input type="number" placeholder= "Number of Attempts" step="1" id="attempts" v-model.number="newLog.attempts">
          </div>
          <div class="form-field">
              <!-- <input type="text" placeholder="Comments" id="comments" v-model="newLog.route_comments"> -->
               <textarea type="text" id="comments" placeholder="Write a comment" v-model="newLog.route_comments"></textarea>
          </div>
          <div class="form-field">
              <input id="submit" type="submit" v-on:click="setLogInfo">
              <!-- <button id="submit" v-on:click="setLogInfo" type="submit">Submit</button> -->
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
                date_sent: null
            }
        }
    },
    methods: {
        addLog() {
            activityLogService.addActivityLog(this.newLog.user_id, this.newLog)
            .then(() => {
                this.$router.push({name: 'climbing-log', params: {userId: this.newLog.user_id}});
                this.newLog = [];
                // alert("Added to MyClimbs")                
            })
        },
        setLogInfo() {
            this.newLog.user_id = this.$store.state.user.id
            this.newLog.route_id = this.$store.state.routeInfo.route_id
        },
    }

}
</script>

<style>

.log-form {
    border: 2px solid #ccc;
    border-radius: 25px;
    padding: 1rem;
    width: 60%;
}

#submit {
  border: none;
  color: black;
  border-radius: 25px;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border: 1px solid grey;
}

#submit:hover {
  background-color: #008CBA;
  color: white;
}

#form-title {
    font-family: 'Lato', sans-serif;
    font-family: 'Poppins', sans-serif;
}

#comments {
  width: 90%;
  height: 100px;
  margin-top: 12px;
  margin-bottom: 12px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
}

#comments[type-text]:focus {
    border: 3px solid #555;
}

#attempts {
  width: 90%;
  height: 30px;
  margin-top: 12px;
  margin-bottom: 12px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}

#date-sent {
  width: 90%;
  height: 30px;
  margin-top: 12px;
  margin-bottom: 12px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}

</style>