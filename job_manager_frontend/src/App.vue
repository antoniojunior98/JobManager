<template>
  <div id="app">
    <header
      class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"
    >
      <p id="logo" class="h5 my-0 me-md-auto fw-normal">Job Manager</p>
        <nav id="menu" class="my-2 my-md-0 me-md-3">
        <router-link to="/Jobs" class="p-2 text-dark" v-if="jwt">Serviços</router-link>
        <router-link to="/users" class="p-2 text-dark" v-if="jwt">Usuários</router-link>
        <router-link to="/" class="p-2 text-dark" v-if="!jwt">Home</router-link>
        <router-link to="/about" class="p-2 text-dark">Sobre</router-link>
        <router-link to="/contact" class="p-2 text-dark">Contato</router-link>
      </nav>
      <b-button variant="btn btn-outline-info btn-sm" v-if="jwt" v-on:click="logout()"
        >Sair</b-button
      >
      <b-button v-else variant="btn btn-outline-info btn-sm" @click="$router.push('/login')">Entrar</b-button>
    </header>

    <main class="container">
      <router-view />

      <footer id="footer" class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
          <div class="col-12 col-md">
            <small class="d-block mb-3 text-muted">Job Manager &copy; 2020</small>
          </div>
          <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Coisas legais</a></li>
              <li><a class="link-secondary" href="#">Outro</a></li>
              <li><a class="link-secondary" href="#">Última vez</a></li>
              <li><a class="link-secondary" href="#">Outro</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Recursos</a></li>
              <li><a class="link-secondary" href="#">Recurso</a></li>
              <li><a class="link-secondary" href="#">Outro</a></li>
              <li><a class="link-secondary" href="#">Outro</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Sobre</h5>
            <ul class="list-unstyled text-small">
              <li><router-link to="/about" class="link-secondary">Job Manager</router-link></li>
              <li><a class="link-secondary" href="#">Localização</a></li>
              <li><a class="link-secondary" href="#">Privacidade</a></li>
              <li><a class="link-secondary" href="#">Termos</a></li>
            </ul>
          </div>
        </div>
      </footer>
    </main>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'App',
  data () {
    return {
      jwt: localStorage.getItem('jwt')
    }
  },
  methods: {
    logout: function (jwt) {
      localStorage.setItem('jwt', '')
      this.$router.push({ name: 'Home' })
      this.$router.go(0)
      axios
        .get('http://127.0.0.1:8000/api/logout/', {
          headers: {
            Authorization: this.jwt
          }
        })
        .the((response) => {
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>

<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
#logo {
  color: #48bfdb;
}
</style>
