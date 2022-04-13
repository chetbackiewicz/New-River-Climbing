import axios from 'axios';

export default {
    getRoutesByCragName(areaName, cragName) {
        return axios.get(`/areas/${areaName}/crags/${cragName}/routes`);
    }
}