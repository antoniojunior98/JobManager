<template>
  <div class="EditJob">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h2>Editar Job</h2>
    </div>
    <go-back router="/jobs"></go-back>
    <div class="row row-cols-1">
      <b-form @submit="edit">
        <b-alert v-if="success" variant="success" show>{{ success }}</b-alert>
        <b-alert v-if="error" variant="warning" show>{{ error }}</b-alert>
        <b-form-group id="input-group" label="Descrição:">
          <b-form-input
            id="input"
            :class="descriptionIsInvalid"
            v-model="description"
            type="text"
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

        <b-button type="sumit" variant="success">Salvar</b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'EditUser',
  data () {
    return {
      id: this.$route.params.id,
      description: '',
      delivery_date: '',
      success: '',
      error: '',
      descriptionError: '',
      dateError: '',
      descriptionIsInvalid: 'form-control',
      dateIsInvalid: 'form-control'
    }
  },
  methods: {
    getJob: function () {
      axios
        .get('http://127.0.0.1:8000/api/job/' + this.id + '/show', {
          headers: {
            Authorization: localStorage.getItem('jwt')
          }
        })
        .then((response) => {
          this.description = response.data.description
          this.delivery_date = response.data.delivery_date
        })
        .catch((error) => {
          if (error.response.status === 401) {
            localStorage.setItem('jwt', '')
            this.$router.push({ name: 'Login' })
            this.$router.go(0)
          }
        })
    },
    edit: function (event) {
      event.preventDefault()
      axios
        .put(
          'http://127.0.0.1:8000/api/job/' + this.id + '/edit',
          {
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
          setTimeout(() => {
            this.success = ''
          }, 2000)
        })
        .catch((error) => {
          if (error.response.status === 401) {
            localStorage.setItem('jwt', '')
            this.$router.push({ name: 'Login' })
            this.$router.go(0)
          }
          if (error.response.status === 500) {
            this.error = error.response.data.error
            setTimeout(() => {
              this.error = ''
            }, 3000)
          }
          error = error.response.data.error
          if (error.description) {
            this.descriptionError = error.name[0]
            this.descriptionIsInvalid = 'form-control is-invalid'
          }
          if (error.delivery_date) {
            this.dateError = error.email[0]
            this.dateIsInvalid = 'form-control is-invalid'
          }
        })
    }
  },
  mounted () {
    this.getJob()
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
.EditUser {
  margin-bottom: 200px;
}
</style>
