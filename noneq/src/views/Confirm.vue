<template>
  <div id="app">

    <div class="container is-max-desktop p-5 ">
      <div class="column pt-2 pl-0 pr-0" v-for="inOrder in order_details" :key="inOrder.order_id">
        <div class="card mb-1">
          <div class="card-content p-0">
            <div class="media">
              <div class="media-left">
                <figure class="image is-96x96 pt-3">
                  <img :src="'http://localhost:3000' + inOrder.menu_pic" alt="Placeholder image" />
                </figure>
              </div>
              <div class="media-content pt-2">
                <p class="title is-5">{{ inOrder.menu_name }}</p>
                <div style="display: flex;justify-content: space-between;">
                  <div>
                    <div class="fw-bold fs-5">
                      x {{ inOrder.quantity }} <br>
                      {{ inOrder.quantity_price }} บาท
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="fw-bold fs-5" v-for="inOrder in orders" :key="inOrder.order_id">ราคารวม: {{ inOrder.order_price }}</div>
      
      <router-link to="/tables">
        <a class="button is-dark mt-3 fw-bold fs-5" style="width: 100%;color: white; text-decoration: none;"
          @click="menuConfirm()">Home</a>
      </router-link>
      <template v-if="this.$cookies.isKey('account')">
        <a class="button is-danger mt-3 fw-bold fs-5" style="width: 100%;color: white; text-decoration: none;"
          @click="checkout()">Checkout</a>
      </template>

      <hr>
    </div>

  </div>
</template>

<script>

import axios from "axios";

// @ is an alias to /src
export default {
  name: "ConfirmPage",
  data() {
    return {
      order_details: [],
      orders: [],
      center: {
        'd-flex': true,
        'justify-content-center': true,
        'align-items-center': true
      },
    };
  },
  methods: {
    getOrderDetail() {
      axios.get("http://localhost:3000/orderdetail")
        .then(response => {
          this.order_details = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getOrder() {
      axios.get("http://localhost:3000/order")
        .then(response => {
          this.orders = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    checkout(){

    },
  },  

  mounted() {
    this.getOrderDetail();
    this.getOrder();
  },
  
  watch: {
    '$route'(to, from) {
      this.previousRoutes.push(from)
    },
  },


};
</script>
