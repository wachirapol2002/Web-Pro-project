<template>
  <div id="app">

    <div class="container is-max-desktop p-5 ">
<<<<<<< Updated upstream
      <div class="column pt-2 pl-0 pr-0" v-for="order in order_details" :key="order.order_price">
        <div class="card mb-1" v-for="image in filteredImages(order.menu_id)" :key="image.menu_id">
=======
      <div class="row mx-5">
                        <h1>{{"โต๊ะหมายเลข "+table.table_num}}</h1>
      </div>
      <div class="column pt-2 pl-0 pr-0" v-for="inOrder in order_details" :key="inOrder.order_id">
        <div class="card mb-1">
>>>>>>> Stashed changes
          <div class="card-content p-0">
            <div class="media" >
              <div class="media-left" >
                <figure class="image is-96x96 pt-3">
                  <img :src="'http://localhost:3000' + image.menu_pic" alt="Placeholder image" />
                </figure>
              </div>
              <div class="media-content pt-3 fw-bold fs-5">
                {{ image.menu_name }}
                <div style="display: flex;justify-content: space-between;">
                  <div>
                    <div class="fw-bold fs-5">
                      x {{ order.quantity }} <br>
                      {{ order.quantity_price }} บาท
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="fw-bold fs-5">ราคารวม: {{ table.total_price }} บาท</div>

      <router-link :to="{ path: '/order', query: { table: this.table.table_num } }">
        <div class="button is-dark mt-3 fw-bold fs-5" style="width: 100%;color: white; text-decoration: none;">
          สั่งอาหารเพิ่ม</div>
      </router-link>
      <template v-if="this.$cookies.isKey('account')">
        <div class="button is-danger mt-3 fw-bold fs-5" style="width: 100%;color: white; text-decoration: none;"
          @click="checkout()">เรียกพนักงานเพื่อ Checkout</div>
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

    filteredImages(menuId) {
      return this.images.filter((image) => image.menu_id === menuId);
    },

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
      const data = {
          table: this.$route.query.table
        }
      axios.post("http://localhost:3000/order", data)
        .then(response => {
          this.orders = response.data.orders;
          console.log(this.orders)
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
    checkout() {
      const data = {
        username: this.table.username,
        table: this.table.table_num,
        total_price: this.table.total_price
      }
      axios.post("http://localhost:3000/table/checkout", data)
        .then(response => {
          console.log(response)
          this.$router.push({ path: '/tables' })
        })
        .catch(err => {
          console.log(err);
        });
    },
    getTable() {
      axios.get("http://localhost:3000/?search=" + this.$route.query.table)
        .then(response => {
          this.table = response.data[0];
        })
        .catch(err => {
          console.log(err);
        });
    },
  },

  mounted() {
    this.getTable();
    this.getImages();
    this.getOrder();
    // this.getOrderDetail();
  },

  watch: {
    '$route'(to, from) {
      this.previousRoutes.push(from)
    },
  },


};
</script>
