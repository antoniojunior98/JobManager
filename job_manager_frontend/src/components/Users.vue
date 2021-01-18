<template>
  <div class="home">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Usuários</h1>
    </div>

    <div class="row row-cols-1 text-center">
      <div class="table-responsive">
      <table class="table table-hover table-sm">
        <b-button variant="btn btn-outline-success" v-on:click="add()"
          >Adicionar</b-button
        >
        <tr>
          <th>Nome</th>
          <th>E-mail</th>
          <th>Ações</th>
        </tr>
        <tr v-for="user in users.data" :key="user.id">
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>
            <b-button-group>
              <b-button variant="btn btn-outline-info btn-sm" v-on:click="edit(user.id)"
                >Editar</b-button
              >
              <b-button variant="btn btn-outline-danger btn-sm" v-on:click="del(user.id)"
                >Excluir</b-button
              >
            </b-button-group>
          </td>
        </tr>
      </table>

      <nav id="pagination" aria-label="..." v-if="users">
          <ul class="pagination">
            <li class="page-item" :class="{disabled: current_page == 1}">
              <a class="page-link" href="#"
                @click="getUsers(current_page-1)">Anterior</a
              >
            </li>
            <li v-for="page in pages" :key="page" class="page-item" :class="{active: current_page == page}">
              <a class="page-link" @click="getUsers(page)">{{ page }}</a>
            </li>
            <li class="page-item" :class="{disabled: current_page == last_page}">
              <a class="page-link" href="#"  @click="getUsers(current_page+1)">Próximo</a>
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
  name: 'Home',
  data () {
    return {
      users: null,
      pages: null,
      current_page: null,
      last_page: null
    }
  },
  mounted () {
    this.getUsers()
  },
  methods: {
    getUsers: function (page = 1) {
      axios
        .get('http://127.0.0.1:8000/api/users?page=' + page, {
          headers: {
            Authorization: localStorage.getItem('jwt')
          }
        })
        .then((response) => {
          this.users = response.data
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
      this.$router.push('/user/add')
    },
    edit: function (id) {
      this.$router.push('/user/' + id + '/edit')
      this.id_user = id
    },
    del: function (id) {
      if (confirm('Tem certeza que deseja excluir o usuário?')) {
        axios
          .delete('http://127.0.0.1:8000/api/user/' + id + '/delete', {
            headers: {
              Authorization: localStorage.getItem('jwt')
            }
          })
          .then((response) => {
            this.getUsers()
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
#pagination {
  margin-top: 50px;
}
.home {
  margin-bottom: 300px;
}
</style>
