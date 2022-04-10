import axios from 'axios';

export default {
    getAllAreas() {
        return axios.get('/areas');
    },

    getAreaByName(name) {
        return axios.get(`/areas/${name}`);
    }
}