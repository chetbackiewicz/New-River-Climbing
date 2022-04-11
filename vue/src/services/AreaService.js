import axios from 'axios';

export default {
    getAllAreas() {
        return axios.get('/areas');
    },

    getAreaInformationByName(name) {
        return axios.get(`/areas/${name}`);
    }
}