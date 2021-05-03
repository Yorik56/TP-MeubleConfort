import axios from "axios"

class Categorie_service {
    constructor() {
        this.axios = axios.create({
            baseUrl: 'http://localhost:3000'
        });
    }

    async getAll(){
        let response = await this.axios.get('/home');
        return response.data;
    }

/*    async getAll(){
        let response = await this.axios.get("/home", {

        });
        return response.data;
}*/

/*    async getAll(){
    let response = await this.axios.get("/home", {

    });
    return response.data;
}*/

/*    async getAll(){
    let response = await this.axios.get("/home", {

    });
    return response.data;
}*/


}
export default new Categorie_service();
