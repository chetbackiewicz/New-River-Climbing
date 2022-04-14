import axios from 'axios';

export default {
    getActivityLogsByUserId(userId) {
        return axios.get(`/${userId}/activity-log`);
    },

    addActivityLog(log, userId) {
        return axios.post(`/${userId}/activity-log`, log);
    }
}