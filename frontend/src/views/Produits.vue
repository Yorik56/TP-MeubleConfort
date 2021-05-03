<template>
  <div class="container">
    <div class="row">
    </div>
    <div class="row">
      <div class="col-3" v-for="data in products"  :key="data.id">
        <div class="card">
          <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
          <div class="card-body">
            <h5 class="card-title">{{data.titre}}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <router-link class="btn btn-primary" :to="{ name: 'produit', params: { idProduct: data.id }}">Aller voir </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import json from "@/assets/data.json"
export default {
  name: "Produits",
  data(){
    return{
      myJson: json,
      id:0,
      idProducts: 0,
      sousCat: [],
      products: []
    }
  },
  created() {
    this.id = parseInt(this.$route.params.idC);
    this.idProducts = parseInt(this.$route.params.idProducts);
    console.log(this.$route.params);
    this.getProduits();
  },
  methods:{
    getProduits(){
      this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;
      this.products = this.sousCat.find(sousCat => sousCat.id === this.idProducts).produits;
    }
  }
}
</script>

<style scoped>

</style>