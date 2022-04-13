import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    areas: [],
    crags: [],
    routes: [],
    currentArea: '',
    areaInfo: [],
    cragInfo: []
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_AREAS(state, areas) {
      state.areas = areas;
    },
    SET_CURRENT_AREA(state, areaName) {
      state.currentArea = areaName;
    },
    SET_AREA_INFO(state, areaInfo) {
      state.areaInfo = areaInfo;
    },
    SET_CRAGS(state, crags) {
      state.crags = crags;
    },
    SET_ROUTES(state, routes) {
      state.routes = routes;
    },
    SET_CRAG_INFO(state, crag) {
      state.cragInfo = crag;
    }
  }
})
