import axios from 'axios';

export default {
    getAreaComments(areaName) {
        return axios.get(`/areas/${areaName}/comments`);
    },

    addAreaComment(areaName, comment) {
        return axios.post(`/areas/${areaName}/comments`, comment);
    },
    getCragComments(cragName) {
        return axios.get(`/crags/${cragName}/comments`);
    },

    addCragComment(cragName, comment) {
        return axios.post(`/crags/${cragName}/comments`, comment)
    },
    getRouteComments(routeName) {
        return axios.get(`/routes/${routeName}/comments`);
    },

    addRouteComment(routeName, comment) {
        return axios.post(`/routes/${routeName}/comments`, comment);
    },
}