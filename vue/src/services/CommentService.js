import axios from 'axios';

export default {
    getAreaComments(areaName) {
        return axios.get(`/areas/${areaName}/comments`);
    },

    addAreaComment(areaName) {
        return axios.post(`/areas/${areaName}/comments`);
    }
}