<template>
  <div class="container">
    <div class="row">
      <div class="col-3" v-for="data in myJson"  :key="data.id">
        <div class="card">
          <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
          <div class="card-body">
            <h5 class="card-title">{{data.titre}}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
            <router-link class="btn btn-primary" :to="{ name: 'sous_categorie', params: { id: data.id }}">Aller voir </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
name: "Sous_categories",
  created() {
    console.log(this.$route.params);
  }
}




</script>

<style scoped>

</style>