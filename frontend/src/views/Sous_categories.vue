<template>
  <div class="container">
    <div class="row">
      <h1>{{ nameSousCat }}</h1>
    </div>
    <div class="row">
      <div class="col-3" v-for="data in sousCat"  :key="data.id">
<!--        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{data.titre}}</h5>
            <img  class="imgProduct" :src="require(`../assets/Categories/${nameSousCat}/Sous_Catégories/${data.titreSysteme}/SousCat_${data.titreSysteme}.jpg`)" :alt="data.titre">
&lt;!&ndash;            src/assets/Categories/*Chambre*/Sous_Catégories/*Lit*/SousCat_Lit.jpg&ndash;&gt;
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <router-link class="btn btn-primary" :to="{ name: 'produits', params: { idProducts: data.id }}">Aller voir </router-link>
          </div>
        </div>-->

        <card
            v-bind:titre="data.titre"
            v-bind:nameSousCat="nameSousCat"
            v-bind:titreSysteme="data.titreSysteme"
            v-bind:id="data.id"
            v-bind:link="{ name: 'produits', params: { idProducts: data.id }}"
        />
      </div>
    </div>
  </div>
</template>


<script>
import json from "@/assets/data.json"
import card from "@/components/Card.vue"
export default {
name: "Sous_categories",
  data(){
    return{
      id:0,
      nameSousCat: "",
      myJson: json,
      sousCat: [],
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