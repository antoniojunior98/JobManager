<template>
  <div class="AddUser">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h2>Cadastrar Usuário</h2>
    </div>
    <go-back router="/users"></go-back>
    <div class="row row-cols-1">
      <b-form @submit="add">
        <b-alert v-if="success" variant="success" show>{{ success }}</b-alert>
        <b-form-group id="input-group" label="Nome:">
          <b-form-input
            id="input"
            :class="nameIsInvalid"
            v-model="name"
            type="text"
            placeholder="Digite seu nome"
          ></b-form-input>
          <div class="invalid-feedback" >
            {{nameError}}
        </div>
        </b-form-group>

        <b-form-group id="input-group" label="E-mail:">
          <b-form-input
            id="input"
            :class="emailIsInvalid"
            v-model="email"
            type="email"
            placeholder="Digite seu E-mail"
          ></b-form-input>
          <div class="invalid-feedback" >
            {{emailError}}
        </div>
        </b-form-group>

        <b-form-group id="input-group" label="Senha:">
          <b-form-input
            id="input"
            :class="passwordIsInvalid"
            v-model="password"
            type="password"
          ></b-form-input>
          <div class="invalid-feedback" >
            {{passwordError}}
        </div>
        </b-form-group>

        <b-button type="sumit" variant="success">Salvar</b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'AddUser',
  data () {
    return {
      name: '',
      email: '',
      password: '',
      success: '',
      nameError: '',
      emailError: '',
      passwordError: '',
      nameIsInvalid: 'form-control',
      emailIsInvalid: 'form-control',
      passwordIsInvalid: 'form-control'
    }
  },
  methods: {
    add: function (event) {
      event.preventDefault()
      axios
        .post('http://127.0.0.1:8000/api/user/add', {
          name: this.name,
          email: this.email,
          password: this.password
        })
        .then((response) => {
          this.success = response.data.success
          this.name = ''
          this.email = ''
          this.password = ''
          setTimeout(() => {
            this.success = ''
          }, 2000)
        })
        .catch((error) => {
          if (error.response.status === 401) {
            this.$router.push({ name: 'Login' })
          }
          if (error.response.status === 500) {
            this.error = error.response.data.error
            setTimeout(() => {
              this.error = ''
            }, 3000)
          }
          error = error.response.data.error
          if (error.name) {
            this.nameError = error.name[0]
            this.nameIsInvalid = 'form-control is-invalid'
          }
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
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #48bfdb;
}
.AddUser{
  margin-bottom: 200px;
}
</style>
