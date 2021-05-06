<template>
  <div class="container">
    <div class="row">
      <h1 v-if="nameCat[0]">{{ nameCat[0].titre }}</h1>
    </div>
    <div class="row">
      <div class="col-3" v-for="data in categories"  :key="data.id">
        <card
            :url= "nameCat[0].titre_systeme + '/Sous_Catégories/' + data.titreSysteme + '/Sous_Cat_' + data.imageSousCategorie"
            :titre= "data.titre"
            :link= "{ name: 'produits', params: { idProducts: data.id }}"
            :description="data.Description"
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
  name: "Sous_categories",
    data(){
      return{
        id:0,
        nameCat: "",
        myJson: json,
        sousCat: [],
        categories: ""
      }
    },
    components: {
        card
    },
    created() {
      this.id = parseInt(this.$route.params.idC);
      console.log(this.$route.params);
      this.getSousCat();
    },
    async mounted() {
      Categorie_service.getSousCategories(this.id)
          .then((response) => {
            console.log(response)
            this.categories = response
          })
          .catch((error) => {
            this.loading = false
            console.log(error.response)
          })

      Categorie_service.getNameCategorie(this.id)
          .then((response) => {
            console.log(response)
            this.nameCat = response
          })
          .catch((error) => {
            this.loading = false
            console.log(error.response)
          })

    },
    methods:{
      getSousCat(){
        this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;
        this.nameSousCat = this.myJson.find(myJson => myJson.id === this.id).titre;
      }
    }
  }
</script>

<style scoped>

</style>