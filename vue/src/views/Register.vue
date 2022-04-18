<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h3 id="create-account-header" class="h3 mb-3 font-weight-normal">Create Account</h3>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
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
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <router-link id="have-account" :to="{ name: 'login' }">Have an account?</router-link>
      <button id="create-account-button" class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>

#register {
  display: flex;
  justify-content: center;
  background-color: #659dbd;
}

.form-register {
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

#create-account-header {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  background-color: skyblue;
  color: white;
  padding: 0;
}

#create-account-button {
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

#create-account-button:hover {
  background-color: #008CBA;
  color: white;
}

#confirmPassword {
  width: 70%;
  height: 20px;
  border-radius: 15px;
  padding: 5px;
  margin-top: 10px;
}

#have-account {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-top: 10px;
  color: white;
}



</style>
