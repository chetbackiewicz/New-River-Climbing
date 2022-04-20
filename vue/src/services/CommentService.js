import axios from 'axios';

export default {
    getAreaComments(name) {
        return axios.get(`/areas/${name}/comments`);
    },

    addAreaComment(area) {
        return axios.post(`/areas/${area}/comments`);
    }
}