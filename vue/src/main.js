import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
// Import the functions you need from the SDKs you need
import firebase from "firebase/compat/app"
import 'firebase/compat/storage'
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries


axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  router,
  store,
  render: h => h(App),

  created() {
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
    apiKey: "AIzaSyB6p-jTMHh_z3af5-Se31dJNy09QbfrnDo",
    authDomain: "new-river-climbing.firebaseapp.com",
    projectId: "new-river-climbing",
    storageBucket: "new-river-climbing.appspot.com",
    messagingSenderId: "556465679572",
    appId: "1:556465679572:web:dc89113fd4ebd4c4ad1f41",
    measurementId: "G-J53LD3Z71Z"
    };

    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);               
  }
}).$mount('#app')

