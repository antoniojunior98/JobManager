<template>
  <div class="AddJob">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h2>Adicionar Job</h2>
    </div>
    <go-back router="/jobs"></go-back>
    <div class="row row-cols-1">
      <b-form @submit="add">
        <b-alert v-if="success" variant="success" show>{{ success }}</b-alert>
        <b-alert v-if="error" variant="warning" show>{{ error }}</b-alert>
        <b-form-group id="input-group" label="Nome:">
          <b-form-input
            id="input"
            :class="nameIsInvalid"
            v-model="name"
            type="text"
            placeholder="Digite o nome"
          ></b-form-input>
          <div class="invalid-feedback">
            {{ nameError }}
          </div>
        </b-form-group>

        <b-form-group id="input-group" label="Descrição:">
          <b-form-input
            id="input"
            :class="descriptionIsInvalid"
            v-model="description"
            type="text"
            placeholder="Digite a descrição do job"
          ></b-form-input>
          <div class="invalid-feedback">
            {{ descriptionError }}
          </div>
        </b-form-group>

        <b-form-group id="input-group" label="Data de entraga:">
          <b-form-input
            id="input"
            :class="dateIsInvalid"
            v-model="delivery_date"
            type="date"
          ></b-form-input>
          <div class="invalid-feedback">
            {{ dateError }}
          </div>
        </b-form-group>

        <b-button type="sumit" variant="success">Criar</b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'AddJob',
  data () {
    return {
      name: '',
      description: '',
      delivery_date: '',
      success: '',
      error: '',
      nameError: '',
      descriptionError: '',
      dateError: '',
      nameIsInvalid: 'form-control',
      descriptionIsInvalid: 'form-control',
      dateIsInvalid: 'form-control'
    }
  },
  methods: {
    add: function (event) {
      event.preventDefault()
      axios
        .post(
          'http://127.0.0.1:8000/api/job/add',
          {
            name: this.name,
            description: this.description,
            delivery_date: this.delivery_date
          },
          {
            headers: {
              Authorization: localStorage.getItem('jwt')
            }
          }
        )
        .then((response) => {
          this.success = response.data.success
          this.name = ''
          this.description = ''
          this.date = ''
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
            }, 2000)
          }
          error = error.response.data.error
          if (error.name) {
            this.nameError = error.name[0]
            this.nameIsInvalid = 'form-control is-invalid'
          }
          if (error.description) {
            this.descriptionError = error.description[0]
            this.descriptionIsInvalid = 'form-control is-invalid'
          }
          if (error.delivery_date) {
            this.dateError = error.delivery_date[0]
            this.dateIsInvalid = 'form-control is-invalid'
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
.AddUser {
  margin-bottom: 200px;
}
</style>
