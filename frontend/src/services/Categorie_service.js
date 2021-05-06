import axios from "axios"

class Categorie_service {
    constructor() {
        this.axios = axios.create({
            baseURL: 'http://localhost:3000'
        });
    }

    async getAll(){
        let response = await this.axios.get('/home');
        return response.data
    }

    async getSousCategories(id){
        let response = await this.axios.get("/sous_categories/" + id, {

        });
        return response.data;
    }

    async getNameCategorie(id){
        let response = await this.axios.get("/Namecategorie/" + id, {

        });
        return response.data;
    }

    async getAllProducts(id){
        let response = await this.axios.get("/all_products/" + id, {

        });
        return response.data;
    }


    async getNameSousCategorie(id){
        let response = await this.axios.get("/nomSousCategorie/" + id, {

        });
        return response.data;
    }

    async getProduct(id){
        let response = await this.axios.get("/product/" + id, {

        });
        return response.data;
    }

    async addProduct(id){
        let response = await this.axios.get("/addProduct/" + id, {

        });
        return response.data;
    }
    async Sauvegarde(form) {
        console.log(form)
        let response = await this.axios.post('/inscription/', form)
        return response.data
    }



}
export default new Categorie_service()
