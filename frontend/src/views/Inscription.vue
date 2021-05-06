<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-4"></div>
      <div class="col-4">
        <b-form @submit.prevent="onSubmit" >

          <b-form-group id="input-group-2" label="Nom:" label-for="input-2">
            <b-form-input
                id="input-2"
                v-model="form.nom"
                placeholder="Entrer nom"
                required
            ></b-form-input>
          </b-form-group>
          <b-form-group id="input-group-2" label="Prénom:" label-for="input-2">
            <b-form-input
                id="input-2"
                v-model="form.prenom"
                placeholder="Entrer prénom"
                required
            ></b-form-input>
          </b-form-group>
          <b-form-group id="input-group-2" label="Code postal et prénom" label-for="input-2">
            <b-row>
              <b-col6>
                <b-form-input
                    type="number"
                    id="input-2"
                    v-model="form.cp"
                    placeholder="Entrer cp"
                    required
                    class="d-inline"
                    minlength="5" maxlength="5" size="5"
                ></b-form-input>

              </b-col6>
              <b-col-6 >
                <b-form-input
                    id="input-2"
                    class="d-inline"
                    v-model="form.rue"
                    placeholder="Entrer rue"
                    required
                ></b-form-input>
              </b-col-6>
            </b-row>
          </b-form-group>

          <b-form-group id="input-group-2" label="Ville:" label-for="input-2">
            <b-form-input
                id="input-2"
                v-model="form.ville"
                placeholder="Entrer ville"
                required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-2" label="Pays:" label-for="input-2">
            <b-form-input
                id="input-2"
                v-model="form.pays"
                placeholder="Entrer pays"
                required
            ></b-form-input>
          </b-form-group>


          <b-button type="submit" variant="primary">Submit</b-button>
          <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
      </div>
      <div class="col-4"></div>
    </div>
  </div>
</template>

<script>

import Categorie_service from "../services/Categorie_service";
export default {
  name: "Inscription",
  data() {
    return{
      form :
          {
            "nom" : "",
            "prenom": "",
            "cp":"",
            "rue":"",
            "ville":"",
            "pays":""

          }
    }
  },
  methods:{
    onSubmit(event) {
      console.log(event)
      if (
          this.form.nom != null &&
          this.form.prenom != null &&
          this.form.cp != null &&
          this.form.ville != null &&
          this.form.pays != null &&
          this.form.rue != null &&
          (this.form.cp.length) === 5
          // this.form.cp.isInteger()
      )
      {
        Categorie_service.Sauvegarde(this.form).then((response) => {
          console.log(response)
          this.category = response
          console.log(this.category)
          alert('Formulaire envoyé')
        })
            .catch((error) => {
              this.loading = false
              console.log(error)
              console.log(error.response)
            })
      } else {
        if((this.form.cp.length) !== 5){
          alert('Le Code postal doit contenir 5 chiffres')
        }
        // else if(!this.form.cp.isInteger()){
        //   alert('Le Code postal doit être un entier')
        // }
        else {
          alert('Le formulaire n\'est pas correctement remplis')
        }

      }

      // console.log(this.form)

    }
  }
}
</script>

<style scoped>

</style>