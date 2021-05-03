<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <div class="container">
      <div class="row">
        <div class="col-3" v-for="data in categories"  :key="data.id">
            <div class="card">
<!--            <img class="card-img-top" src="..." alt="Card image cap">-->
            <div class="card-body">
              <h5 class="card-title">{{data.titre}}</h5>
<!--              <img  class="imgProduct" :src="require(`../assets/Categories/${data.titreSysteme}/Cat_${data.titreSysteme}.jpg`)" :alt="data.titre">-->
<!--              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>-->
<!--              <router-link class="btn btn-primary" :to="{ name: 'sous_categorie', params: { idC: data.id }}">Aller voir </router-link>-->
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
import Categorie_service from "@/services/Categorie_service";


export default {
  name: 'Home',
  data(){
    return{
      myJson: json,
      categories: '',

    }
  },
  async mounted () {

    Categorie_service.getAll().then((res)=>{
      console.log('toto');
      if(res) {
        this.categories = res;
      }
    })
        .catch((err)=> console.log(err));
  },
  created(){
    console.log("hello home")
  },

  methods: {

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