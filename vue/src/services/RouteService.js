import axios from 'axios';

export default {
    getRoutesByCragName(areaName, cragName) {
        return axios.get(`/areas/${areaName}/crags/${cragName}/routes`);
    },

    // getRouteByRouteName(areaName, cragName, routeName) {
    //     return axios.get(`/areas/${areaName}/crags/${cragName}/routes/${routeName}`);
    // },

    getAllRoutes() {
        return axios.get('/search');
    },

    getRoute(routeName) {
        return axios.get(`/routes/${routeName}`)
    }
}