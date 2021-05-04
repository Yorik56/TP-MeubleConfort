<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <div class="container">
      <div class="row">
        <div class="col-3" v-for="data in categories"  :key="data.id">
          <card
              :titre = "data.titre"
              :url   = "data.titre_systeme + '/Cat_' + data.ImageCategorie"
              :link="{ name: 'sous_categorie', params: { idC: data.id }}"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import json from "../assets/data.json"
import Categorie_service from "../services/Categorie_service";
import card from "../components/Card"


export default {
  name: 'Home',
  data(){
    return{
      myJson: json,
      categories: '',

    }
  },
  async mounted() {
    Categorie_service.getAll()
        .then((response) => {
          console.log(response)
          this.categories = response
        })
        .catch((error) => {
          this.loading = false
          console.log(error.response)
        })



  },
  methods: {

  },
  components: {
    card
  },
}
</script>

<style >
.card{
  margin-bottom: 20px;
}

.imgProduct{
  width: 100%;
  height: 150px;
}

</style>