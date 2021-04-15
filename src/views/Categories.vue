<template>
  <div class="categories">
    <h1>Catégories</h1>

  </div>

</template>

<script>
import json from '../assets/data.json'
export default {
props: this.myJson,
name: "Categories",
myJson: json,
  data(){
    return{
      myJson: json
    }
  }
}
</script>

<style >
  .card{
    margin-bottom: 20px;
  }
</style>