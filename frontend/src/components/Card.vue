<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">{{ titre }}</h5>
      <img v-if="url"  class="imgProduct" :src="require(`../assets/Categories/${url}`)" :alt="titre">
      <p v-if="description" class=" description_categorie card-text">{{ description }}</p>
      <router-link class="btn btn-primary buttonCard" :to="link">Aller voir </router-link>
      <p v-if="prix" class="card-text">{{prix}} €</p>
      <button v-if="idProductAdd" class="btn btn-primary buttonCard" :click="addProduct(idProductAdd)">  Acheter
      </button>
    </div>
  </div>
</template>

<script>
import Categorie_service from "../services/Categorie_service";
export default {
  name: "card",
  props: [
    'titre',
    'url',
    'link',
      'prix',
      'description',
      'idProductAdd'

  ],
  methods: {
    addProduct(v){
      console.log('ici');
      Categorie_service.addProduct(v)
          .then((response) => {
            console.log(response)
            this.categories = response
          })
          .catch((error) => {
            this.loading = false
            console.log(error.response)
          })
    }
  }
}






</script>

<style >
@import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

p, h5{
  font-family: Montserrat;
}

.description_categorie{
  font-size: 14px;
  margin: 7%;
  height: 95px;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
}

.card {
  height: 420px;
  transition-property: box-shadow;
  transition-duration: 0.5s;
  transition-delay: 0s;

  box-shadow:  0 0 5px #41b883;
}

.card:hover {
  box-shadow: 0 0 6px 7px #2fa56b;
}


.card-body:hover{
  background: #242424;
  color: #fff;
}

.buttonCard{
  margin: 8% 0 0 0;
}



</style>