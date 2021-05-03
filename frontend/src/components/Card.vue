<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">{{ titre }}</h5>
      <img  class="imgProduct" :src="require(`../assets/Categories/${nameSousCat}/Sous_Catégories/${titreSysteme}/SousCat_${titreSysteme}.jpg`)" :alt="titre">
      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      <router-link class="btn btn-primary" :to="link">Aller voir </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "card",
  props: [
    'titre',
    'nameSousCat',
    'titreSysteme',
    'link'

  ]
}






</script>