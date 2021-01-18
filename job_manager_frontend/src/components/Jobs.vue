<template>
  <div class="home">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Job</h1>
    </div>

    <div class="row row-cols-1 text-center">
      <div class="table-responsive">
        <table class="table table-hover table-sm">
          <b-button variant="btn btn-outline-success" v-on:click="add()"
            >Adicionar</b-button
          >
          <tr>
            <th>Nome</th>
            <th>Data de entrega</th>
            <th>Status</th>
            <th>Ações</th>
          </tr>
          <tr v-for="job in jobs.data" :key="job.id">
            <td>{{ job.name }}</td>
            <td>{{ job.delivery_date }}</td>
            <td>
              <span
                id="status"
                class="badge rounded-pill bg-warning"
                v-if="job.status == 'Em andamento'"
              >
                {{ job.status }}</span
              >
              <span
                id="status"
                class="badge rounded-pill bg-success"
                v-if="job.status == 'Concluido'"
                >{{ job.status }}</span
              >
            </td>
            <td>
              <b-button-group>
                <b-button variant="btn btn-outline-info btn-sm" v-on:click="edit(job.id)"
                  >Editar</b-button
                >
                <b-button
                  variant="btn btn-outline-primary btn-sm"
                  v-on:click="show(job.id)"
                  >Ver mais</b-button
                >
                <b-button variant="btn btn-outline-danger btn-sm" v-on:click="del(job.id)"
                  >Excluir</b-button
                >
              </b-button-group>
            </td>
          </tr>
        </table>

        <nav id="pagination" aria-label="..." v-if="jobs">
          <ul class="pagination">
            <li class="page-item" :class="{disabled: current_page == 1}">
              <a class="page-link" href="#"
                @click="getJobs(current_page-1)">Anterior</a
              >
            </li>
            <li v-for="page in pages" :key="page" class="page-item" :class="{active: current_page == page}">
              <a class="page-link" @click="getJobs(page)">{{ page }}</a>
            </li>
            <li class="page-item" :class="{disabled: current_page == last_page}">
              <a class="page-link" href="#"  @click="getJobs(current_page+1)">Próximo</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Jobs',
  data () {
    return {
      jobs: null,
      pages: null,
      current_page: null,
      last_page: null
    }
  },
  mounted () {
    this.getJobs()
  },
  methods: {
    getJobs: function (page = 1) {
      axios
        .get('http://127.0.0.1:8000/api/jobs?page=' + page, {
          headers: {
            Authorization: localStorage.getItem('jwt')
          }
        })
        .then((response) => {
          this.jobs = response.data
          this.pages = response.data.last_page
          this.current_page = response.data.current_page
          this.last_page = response.data.last_page
        })
        .catch((error) => {
          if (error.response.status === 401) {
            localStorage.setItem('jwt', '')
            this.$router.push({ name: 'Login' })
            this.$router.go(0)
          }
        })
    },
    add: function () {
      this.$router.push('/job/add')
    },
    show: function (id) {
      this.$router.push('/job/' + id + '/show')
    },
    edit: function (id) {
      this.$router.push('/job/' + id + '/edit')
    },
    del: function (id) {
      if (confirm('Tem certeza que deseja excluir o job?')) {
        axios
          .delete('http://127.0.0.1:8000/api/job/' + id + '/delete', {
            headers: {
              Authorization: localStorage.getItem('jwt')
            }
          })
          .then((response) => {
            this.getJobs(this.current_page)
          })
          .catch((error) => {
            if (error.response.status === 401) {
              localStorage.setItem('jwt', '')
              this.$router.push({ name: 'Login' })
              this.$router.go(0)
            }
          })
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#status {
  color: #ffffff;
}
#pagination {
  margin-top: 50px;
}
.home {
  margin-bottom: 300px;
}
</style>
