<template>
  <div id="app">

    <div class="container is-max-desktop p-5 ">
      <div class="column pt-2 pl-0 pr-0" v-for="inOrder in order_details" :key="inOrder.order_id">
        <div class="card mb-1">
          <div class="card-content p-0">
            <div class="media">
              <div class="media-left" v-for="Image in images" :key="Image.menu_id">
                <figure class="image is-96x96 pt-3">
                  <img :src="'http://localhost:3000' + Image.menu_pic" alt="Placeholder image" />
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
      <div class="fw-bold fs-5">ราคารวม: {{ table.total_price }}</div>
      
      <router-link :to="{ path: '/order', query: { table: this.table.table_num }}" >
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
      table: {},
      images: [],
      sum_price: 0,

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

    getimages() {
      axios.get("http://localhost:3000/menu")
        .then(response => {
          this.images = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    checkout(

    ){

    },

    getTable() {
      axios.get("http://localhost:3000/?search="+this.$route.query.table)
        .then(response => {
          this.table = response.data[0];
          this.getData()
        })
        .catch(err => {
          console.log(err);
        });
    },
  },  

  mounted() {
    this.getOrderDetail();
    this.getOrder();
    this.getTable();
  },
  
  watch: {
    '$route'(to, from) {
      this.previousRoutes.push(from)
    },
  },


};
</script>
