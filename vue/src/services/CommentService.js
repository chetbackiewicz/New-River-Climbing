import axios from 'axios';

export default {
    getAreaComments(areaName) {
        return axios.get(`/areas/${areaName}/comments`);
    },

    addAreaComment(areaName, comment) {
        return axios.post(`/areas/${areaName}/comments`, comment);
    }
}