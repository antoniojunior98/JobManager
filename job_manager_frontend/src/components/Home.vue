<template>
  <div class="home">
    <h1>{{ msg }}</h1>
    <h2>Comece a usar agora mesmo</h2>
    <ul>
      <li>
        <a><router-link to="/user/add">Cadastrar-se</router-link></a>
      </li>
      <li>
        <a> <router-link to="/login">logar</router-link> </a>
      </li>
    </ul>
    <h2>Informações</h2>
    <ul>
      <li>
        <a>
          <router-link to="/about">Sobre</router-link>
        </a>
      </li>
      <li>
        <a href="http://vuex.vuejs.org/" target="_blank"> Contato </a>
      </li>
    </ul>
  </div>
</template>

<script>

export default {
  name: 'Home',
  data () {
    return {
      msg: 'Bem-vindo ao seu gerenciador de tarefas'
    }
  },
  mounted () {
    this.verifyJwt()
  },
  methods: {
    verifyJwt: function () {
      let jwt = localStorage.getItem('jwt')
      if (jwt) {
        this.$router.push({ name: 'Jobs' })
      }
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
.home{
  margin-top: 80px;
  margin-bottom: 200px;
}
</style>
