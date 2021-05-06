import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/categories',
    name: 'Categories',
    component: () => import(/* webpackChunkName: "about" */ '../views/Categories.vue')
  },
  {
    path: '/sous_categorie/:idC',
    name: 'sous_categorie',
    component: () => import(/* webpackChunkName: "about" */ '../views/Sous_categories.vue')
  },
  {
    path: '/produits/:idC/:idProducts',
    name: 'produits',
    component: () => import(/* webpackChunkName: "about" */ '../views/Produits.vue')
  },
  {
    path: '/produit/:idC/:idProducts/:idProduct',
    name: 'produit',
    component: () => import(/* webpackChunkName: "about" */ '../views/Produit_Fiche.vue')
  },
  {
    path: '/panier',
    name: 'panier',
    component: () => import(/* webpackChunkName: "about" */ '../views/Panier.vue')
  },
  {
    path: '/inscription',
    name: 'inscription',
    component: () => import(/* webpackChunkName: "about" */ '../views/Inscription.vue')
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
