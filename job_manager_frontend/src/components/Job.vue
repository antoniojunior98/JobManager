<template>
  <div class="Job">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h3 class="border-bottom pb-2 mb-0">Job</h3>
    <div class="d-flex text-muted pt-3">
      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">Job</strong>
        {{name}}
      </p>
    </div>

    <div class="d-flex text-muted pt-3">
      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">Descrição</strong>
        {{description}}
      </p>
    </div>

    <div class="d-flex text-muted pt-3">
      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">Data de entrega</strong>
        {{deliveryDate}}
      </p>
    </div>

    <div class="d-flex text-muted pt-3">
      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">Status</strong>
        <span class="badge rounded-pill bg-warning"
          v-if="status == 'Em andamento'">
          {{status }}</span>
          <span id="status" class="badge rounded-pill bg-success"
          v-if="status == 'Concluido'">{{status}}</span>
      </p>
    </div>

    <div v-if="finishedIn" class="d-flex text-muted pt-3">
      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">Concluido em</strong>
        {{finishedIn}} por {{userName}}
      </p>
    </div>

    <small class="d-block text-end mt-3">
      <b-button v-if="status == 'Em andamento'" variant="btn btn-outline-info btn-sm" @click="conclude()">Concluir</b-button>
    </small>
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
      name: '',
      description: '',
      deliveryDate: '',
      userName: '',
      status: '',
      finishedIn: ''
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
          this.name = response.data.name
          this.description = response.data.description
          this.deliveryDate = response.data.delivery_date
          this.status = response.data.status
          this.finishedIn = response.data.finished_in
          this.userName = response.data.userName
        })
        .catch((error) => {
          console.log(error)
        })
    },
    conclude: function () {
      axios
        .get('http://127.0.0.1:8000/api/job/' + this.id + '/conclude', {
          headers: {
            Authorization: localStorage.getItem('jwt')
          }
        })
        .then((response) => {
          this.getJob()
        })
        .catch((error) => {
          console.log(error.response)
        })
    },
    verifyJwt () {
      let jwt = localStorage.getItem('jwt')
      if (!jwt) {
        this.$router.push({ name: 'Login' })
      }
    }
  },
  mounted () {
    this.verifyJwt()
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
p {
    font-size: 14px;
}
#status {
    color: #ffffff;
}
.EditUser {
  margin-bottom: 200px;
}
</style>
