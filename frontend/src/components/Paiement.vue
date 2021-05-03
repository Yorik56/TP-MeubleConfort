<template>
  <div class="modal-backdrop">
    <div class="modal">
      <section class="modal-body">
        <slot name="body">
          <div class="container">
            <h1>Paiement</h1>
            <div>
              <b-form @submit="onSubmit" @reset="onReset" v-if="show">
                <b-form-group
                    id="input-group-1"
                    label="Email address:"
                    label-for="input-1"
                    description="We'll never share your email with anyone else."
                >
                  <b-form-row>
                    <b-col>
                      <b-form-input placeholder="Name" />
                    </b-col>
                    <b-col>
                      <b-form-input placeholder="Surname"/>
                    </b-col>
                  </b-form-row>
                  <b-form-input
                      id="input-1"
                      v-model="form.email"
                      type="email"
                      placeholder="Enter email"
                      required
                  ></b-form-input>
                </b-form-group>

                <b-form-group id="input-group-2" label="Your Name:" label-for="input-2">
                  <b-form-input
                      id="input-2"
                      v-model="form.name"
                      placeholder="Enter name"
                      required
                  ></b-form-input>
                </b-form-group>

                <b-form-group id="input-group-3" label="Food:" label-for="input-3">
                  <b-form-select
                      id="input-3"
                      v-model="form.food"
                      :options="foods"
                      required
                  ></b-form-select>
                </b-form-group>

                <b-form-group id="input-group-4" v-slot="{ ariaDescribedby }">
                  <b-form-checkbox-group
                      v-model="form.checked"
                      id="checkboxes-4"
                      :aria-describedby="ariaDescribedby"
                  >
                    <b-form-checkbox value="me">Check me out</b-form-checkbox>
                    <b-form-checkbox value="that">Check that out</b-form-checkbox>
                  </b-form-checkbox-group>
                </b-form-group>

                <b-button type="submit" variant="primary">Submit</b-button>
                <b-button type="reset" variant="danger">Reset</b-button>
              </b-form>
              <b-card class="mt-3" header="Form Data Result">
                <pre class="m-0">{{ form }}</pre>
              </b-card>
            </div>
          </div>
        </slot>
      </section>
      <footer class="modal-footer">
        <button type="button" class="btn-green" @click="close" >
          Annuler
        </button>
      </footer>
    </div>
  </div>
</template>

<script>

export default {
  name: 'paiement',
  data() {
    return {
      form: {
        email: '',
        name: '',
        food: null,
        checked: []
      },
      foods: [{ text: 'Select One', value: null }, 'Carrots', 'Beans', 'Tomatoes', 'Corn'],
      show: true
    }
  },
  methods: {
    close() {
      this.$emit('close');
    },
    onSubmit(event) {
      event.preventDefault()
      alert(JSON.stringify(this.form))
    },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.email = ''
      this.form.name = ''
      this.form.food = null
      this.form.checked = []
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    }
  },
};
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 1);
  display: flex;
  justify-content: center;
  align-items: center;
  opacity: 1;
}

.modal {
  background: #FFFFFF;
  box-shadow: 2px 2px 20px 1px;
  overflow-x: auto;
  display: flex;
  flex-direction: column;
}

.modal-header,
.modal-footer {
  padding: 15px;
  display: flex;
}

.modal-header {
  position: relative;
  border-bottom: 1px solid #eeeeee;
  color: #4AAE9B;
  justify-content: space-between;
}

.modal-footer {
  border-top: 1px solid #eeeeee;
  flex-direction: column;
  justify-content: flex-end;
}

.modal-body {
  position: relative;
  padding: 20px 10px;
}

.btn-close {
  position: absolute;
  top: 0;
  right: 0;
  border: none;
  font-size: 20px;
  padding: 10px;
  cursor: pointer;
  font-weight: bold;
  color: #4AAE9B;
  background: transparent;
}

.btn-green {
  color: white;
  background: #4AAE9B;
  border: 1px solid #4AAE9B;
  border-radius: 2px;
}
</style>