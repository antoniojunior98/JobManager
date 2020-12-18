<template>
  <div class="Login">
    <main class="form-signin">
      <b-form @submit="login">
        <h1 class="h3 mb-3 fw-normal">Login</h1>
        <b-alert v-if="success" variant="success" show>{{ success }}</b-alert>
        <b-alert v-if="error" variant="warning" show>{{ error }}</b-alert>
        <label for="inputEmail" class="visually-hidden">Email</label>
        <b-form-input
          :class="emailIsInvalid"
          v-model="email"
          type="email"
          id="inputEmail"
          class="form-control"
          placeholder="Digite seu E-mail"
          autofocus
        ></b-form-input>
        <div class="invalid-feedback">
          {{ emailError }}
        </div>

        <label for="inputPassword" class="visually-hidden">Senha</label>
        <b-form-input
          :class="passwordIsInvalid"
          v-model="password"
          type="password"
          id="inputPassword"
          class="form-control"
          placeholder="Password"
        >
        </b-form-input>
        <div class="invalid-feedback">
          {{ passwordError }}
        </div>
        <label>
          <router-link to="/user/add">Cadastra-se</router-link>
        </label>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Entrar</button>
      </b-form>
    </main>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Login',
  data () {
    return {
      name: '',
      email: '',
      password: '',
      error: '',
      emailError: '',
      passwordError: '',
      emailIsInvalid: 'form-control',
      passwordIsInvalid: 'form-control'
    }
  },
  methods: {
    login: function () {
      axios
        .post('http://127.0.0.1:8000/api/login', {
          email: this.email,
          password: this.password
        })
        .then((response) => {
          if (response.data.access_token) {
            localStorage.setItem(
              'jwt',
              response.data.token_type + ' ' + response.data.access_token
            )
            this.$router.push({ name: 'Jobs' })
            this.$router.go(0)
          }
        })
        .catch((error) => {
          if (error.response.status === 401) {
            this.error = 'E-mail e/ou senha incorreto(s)!'
          }
          error = error.response.data.error
          if (error.email) {
            this.emailError = error.email[0]
            this.emailIsInvalid = 'form-control is-invalid'
          }
          if (error.password) {
            this.passwordError = error.password[0]
            this.passwordIsInvalid = 'form-control is-invalid'
          }
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
.Login {
  margin-top: 80px;
  margin-bottom: 150px;
}
</style>
