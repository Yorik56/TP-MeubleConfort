<template>
  <div class="modal-backdrop">
    <div class="modal">
      <header class="modal-header">
        <slot name="header">
          Panier
        </slot>
        <button type="button" class="btn-close" @click="close" > x </button>
      </header>

      <section class="modal-body">
        <slot name="body">
          <div class="container">
            <table id="cart" class="table table-hover table-condensed">
              <thead>
              <tr>
                <th>Image</th>
                <th style="width:50%">Description</th>
                <th style="width:8%">Quantité</th>
                <th style="width:10%">Prix</th>
                <th style="width:22%" class="text-center">Sous-total</th>
                <th style="width:10%"></th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td data-th="Image">

                </td>
                <td data-th="Product">
                  <div class="row">
                    <div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                    <div class="col-sm-10">
                      <h4 class="nomargin">Product 1</h4>
                      <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                    </div>
                  </div>
                </td>
                <td data-th="Quantity">
                  <input type="number" class="form-control text-center" value="1">
                </td>
                <td data-th="Price">1.99€</td>
                <td data-th="Subtotal" class="text-center">1.99</td>
                <td class="actions" data-th="">
                  <button class="btn btn-info btn-sm">refresh</button>
                  <button class="btn btn-danger btn-sm">ok</button>
                </td>
              </tr>
              </tbody>
              <tfoot>
              <tr>
                <td></td>
                <td colspan="2" class="hidden-xs"></td>
                <td class="hidden-xs text-center"><strong>Total 1.99 €</strong></td>
                <td><button class="btn btn-success btn-block" type="button" @click="open">Payer</button></td>
              </tr>
              </tfoot>
            </table>
          </div>
        </slot>
      </section>

      <footer class="modal-footer">
        <button type="button" class="btn-green" @click="close" >
          Continuer la visite
        </button>
      </footer>
    </div>
  </div>
</template>

<script>

export default {
  name: 'panier',
  methods: {
    close() {
      this.$emit('close',1);
    },
    open() {
      this.$emit('close',2);
      },
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