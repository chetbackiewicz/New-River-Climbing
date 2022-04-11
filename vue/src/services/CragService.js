import axios from 'axios';

export default {
    getAllCrags() {
        return axios.get('/crags');
    },

    getCragsByAreaName(name) {
        return axios.get(`/areas/${name}/crags`);
    }
}