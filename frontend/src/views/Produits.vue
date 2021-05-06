<template>
  <div class="container">
    <div class="row">
      <div class="col-3" v-for="data in produits"  :key="data.id">
        <card
            :url= "nameCat[0].titre_systeme + '/Sous_Catégories/' + nomSousCategorie[0].titreSysteme + '/Produits/' + data.image"
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
      nameCat:"",
      nomSousCategorie:"",
      idProducts: 0,
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
  },
  async mounted() {
    Categorie_service.getAllProducts(this.idProducts)
        .then((response) => {
          // console.log(response)
          this.produits = response
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })

    Categorie_service.getNameSousCategorie(this.idProducts)
        .then((response) => {
          this.nomSousCategorie = response;
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })
    Categorie_service.getNameCategorie(this.id)
        .then((response) => {
          console.log(response)
          this.nameCat = response;
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })

  }
}
</script>

<style scoped>

</style>