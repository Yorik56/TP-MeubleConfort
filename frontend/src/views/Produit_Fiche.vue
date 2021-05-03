<template>
  <div class="container">
    <div class="row">
      {{product}}
    </div>
    <div class="row">
      <div class="col-3" >
        <div class="card">
          <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
          <div class="card-body">
            <h5 class="card-title">{{product.titre}}</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
<!--            <router-link class="btn btn-primary" :to="{ name: 'produit', params: { idProducts: data.id }}">Aller voir </router-link>-->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>



<script>
  import json from "@/assets/data.json"
  export default {
    name: "Produit_Fiche",
    data(){
      return{
        myJson: json,
        id:0,
        idProducts: 0,
        idProduct: 0,
        sousCat: [],
        products: [],
        product: []
    }
    },
      created() {
      console.log(this.$route.params);
        this.id = parseInt(this.$route.params.idC);
        this.idProducts = parseInt(this.$route.params.idProducts);
        this.idProduct = parseInt(this.$route.params.idProduct);
      this.getProduit();
    },
    methods:{
      getProduit(){
        this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;
        this.products = this.sousCat.find(sousCat => sousCat.id === this.idProducts).produits;
        this.product = this.products.find(products => products.id === this.idProduct);
      }
    }
  }

</script>

<style scoped>

</style>