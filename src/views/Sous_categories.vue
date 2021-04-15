<template>
  <div class="container">
    <div class="row">
      <div class="col-3" v-for="data in sousCat"  :key="data.id">
        <div class="card">
          <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
          <div class="card-body">
            <h5 class="card-title">{{data.titre}}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <router-link class="btn btn-primary" :to="{ name: 'produits', params: { idProducts: data.id }}">Aller voir </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import json from "@/assets/data.json"
export default {
name: "Sous_categories",
  data(){
    return{
      id:0,
      myJson: json,
      sousCat: [],
    }
  },
  created() {
    this.id = parseInt(this.$route.params.idC);
    console.log(this.$route.params);
    this.getSousCat();
  },
  methods:{
    getSousCat(){
      this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;

    }
  }
}






</script>

<style scoped>

</style>