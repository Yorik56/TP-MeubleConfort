<template>
  <div class="container">
    <div class="row">
    </div>
    <div class="row">
      <div class="col-3" v-for="data in produits"  :key="data.id">
        <card
            :url= "nomCategorie + '/Sous_Catégories/' + nomSousCategorie + '/Produits/' + data.image"
            :titre= "data.titre"
            :link= "{ name: 'produit', params: { idProduct: data.id }}"
        />
      </div>
    </div>
  </div>
</template>

<script>
import json from "@/assets/data.json"
import card from "@/components/Card.vue"
import Categorie_service from "../services/Categorie_service";
export default {
  name: "Produits",
  data(){
    return{
      myJson: json,
      id:0,
      nomCategorie:"",
      nomSousCategorie:"",
      idProducts: 0,
      sousCat: [],
      products: [],
      produits: ""
    }
  },
  components: {
    card
  },
  created() {
    this.id = parseInt(this.$route.params.idC);
    this.idProducts = parseInt(this.$route.params.idProducts);
    // console.log(this.$route.params);
    this.getProduits();
  },
  async mounted() {
    Categorie_service.getAllProducts(this.idProducts)
        .then((response) => {
          console.log(response)
          this.produits = response
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })

    Categorie_service.getNameSousCategorie(this.idProducts)
        .then((response) => {
          this.nomSousCategorie = response[0].titre;
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })

  },
  methods:{
    getProduits(){
      this.nomCategorie = this.myJson.find(myJson => myJson.id === this.id).titre;
      this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;
      this.products = this.sousCat.find(sousCat => sousCat.id === this.idProducts).produits;
    }
  }
}
</script>

<style scoped>

</style>