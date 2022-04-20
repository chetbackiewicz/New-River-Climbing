import axios from 'axios';

export default {
    getActivityLogsByUserId(userId) {
        return axios.get(`/${userId}/activity-log`);
    },

    addActivityLog(userId, log) {
        return axios.post(`/${userId}/activity-log`, log);
    },

    deleteActivity(logId) {
        return axios.delete(`/${logId}/activity-log`)
    }
}