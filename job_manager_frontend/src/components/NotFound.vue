<template>
  <div class="NotFound">
    <h1>404</h1>
    <h2>Oops! Página não encontrada.</h2>
    <p>Não foi possível encontrar a página que você estava procurando</p>
  </div>
</template>

<script>

export default {
  name: 'NotFound',
  data () {
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1{
  font-weight: normal;
  color: #48bfdb;
}
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
