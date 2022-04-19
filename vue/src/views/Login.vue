<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <header id="sign-in">
      <h3 class="sign-in-header">Please Sign In</h3>
      </header>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link id="need-account" :to="{ name: 'register' }">Need an account?</router-link>
      <button class="sign-in-button" type="submit">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>

#username {
  width: 70%;
  height: 20px;
  border-radius: 15px;
  padding: 5px;
}

#password {
  width: 70%;
  height: 20px;
  border-radius: 15px;
  padding: 5px;
}

#need-account{
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  color: white;
  margin-top: 1rem;
}

label {
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  color: white;
  margin: 1rem;
}

#login {
  display: flex;
  justify-content: center;
}

#sign-in {
  background-color: skyblue;
}

.sign-in-header {
  font-family: 'Lato', sans-serif;
  font-family: 'Poppins', sans-serif;
  color: white;
  padding: 0;
}

.form-signin {
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 2px solid skyblue;
  border-radius: 15px;
  width: 300px;
  padding: 2rem;
  margin-top: 8rem;
  margin-bottom: 80vh;
  background-color: skyblue;
}

.sign-in-button {
  border: none;
  color: black;
  border-radius: 25px;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-top: 10px;
}

.sign-in-button:hover {
  background-color: #008CBA;
  color: white;
}

</style>
