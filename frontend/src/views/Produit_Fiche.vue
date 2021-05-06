<template>
  <div v-if="nameCat[0] && product[0]" class="container">
    <div class="row">
      <h3>{{ product[0].titre }}</h3>
    </div>
    <div class="row">
      <div class="col-3" >
        <card
            :url= "nameCat[0].titre_systeme + '/Sous_Catégories/' + nomSousCategorie[0].titreSysteme + '/Produits/' + product[0].image"
            :titre= "product[0].titre"
            :link= "null"
            :prix="product[0].prix"
        />
      </div>
      <div class="col-9 attributsDiv">
        <div class="attributs">
          <p><span>Couleur:</span> {{ product[0].couleur }}</p>
          <p><span>Reference:</span> {{ product[0].reference }}</p>
          <p><span>Design:</span> {{ product[0].design }}</p>
          <p><span>Poids:</span> {{ product[0].poids }}</p>
          <p><span>Largeur:</span> {{ product[0].largeur }}</p>
          <p><span>Longueure:</span> {{ product[0].longueure }}</p>
          <p><span>Hauteur:</span> {{ product[0].hauteur }}</p>
        </div>
      </div>
    </div>
  </div>
</template>



<script>
import json from "@/assets/data.json"
import card from "@/components/Card.vue"
import Categorie_service from "../services/Categorie_service";
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
      product: [],
      nameCat:"",
      nomSousCategorie:""
    }
  },
  components: {
    card
  },
  created() {
    console.log(this.$route.params);
    this.id = parseInt(this.$route.params.idC);
    this.idProducts = parseInt(this.$route.params.idProducts);
    this.idProduct = parseInt(this.$route.params.idProduct);
    this.getProduit();
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
    Categorie_service.getProduct(this.idProduct)
        .then((response) => {
          console.log(response)
          this.product = response;
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })

  },
  methods:{
    getProduit(){
      // this.sousCat = this.myJson.find(myJson => myJson.id === this.id).sousCategories;
      // this.products = this.sousCat.find(sousCat => sousCat.id === this.idProducts).produits;
      // this.product = this.products.find(products => products.id === this.idProduct);
    }
  }
}

</script>

<style scoped>

  h3 {
    text-align: center;
    width: 30%;
    margin: 0 auto 8% auto;
    border: solid 1px black;
    border-radius: 20px;
    box-shadow: 0 0 1px 1px black;
  }

  .attributsDiv{
    display: flex;
    align-items: center;
    /*justify-content: center;*/
    flex-direction: column;
  }

  .attributs{
    text-align: left;
  }

  .attributs > p > span{
    font-weight: bold;
  }

</style>