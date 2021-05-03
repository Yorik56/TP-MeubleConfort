<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <div class="container">
      <div class="row">
        <div class="col-3" v-for="data in myJson"  :key="data.id">
            <div class="card">
<!--            <img class="card-img-top" src="..." alt="Card image cap">-->
            <div class="card-body">
              <h5 class="card-title">{{data.titre}}</h5>
              <img :src="require(`../assets/Categories/${data.titre}/Cat_${data.titre}.jpg`)" :alt="data.titre">
<!--              <img :src="require(`../assets/Categories/Chambre/Cat_Chambre.jpg`)" :alt="data.titre">-->
<!--              src/assets/Categories/Chambre/Cat_Chambre.jpg-->
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <router-link class="btn btn-primary" :to="{ name: 'sous_categorie', params: { idC: data.id }}">Aller voir </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'
import json from "@/assets/data.json"
export default {
  name: 'Home',
  data(){
    return{
      myJson: json,

    }
  },
  methods: {

  }


}
</script>

<style >
.card{
  margin-bottom: 20px;
}

</style>