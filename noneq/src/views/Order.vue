<template>
    <div id="app">

        <div class="columns">
            <div class="column is-8 pt-6">
                <div class="container is-max-desktop">
                    <div class="is-multiline columns is-variable is-2">

                        <div id="card_product" class="column is-one-quarter" v-for="product in menus"
                            :key="product.menu_id">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="'http://localhost:3000' + product.menu_pic" alt="Placeholder image" />
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="fw-bold fs-4">
                                            {{ product.menu_name }}
                                            {{ product.menu_price }} บาท
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <input type="button" class="btn btn-dark fw-bold fs-5" value="Add to Order"
                                            @click="addToOrder(product)">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- ---------------------------------------------------------- -->

            <!-- หน้าต่างยืนยันด้านขวา -->
            <div class="column is-3 pt-6 pl-0 pr-5">
                <div style="display: flex;justify-content: space-between;">
                    <span class="title mb-4 fw-bold fs-3">รายการอาหารที่สั่ง</span>
                    <a @click="setZero(product)" class=" mb-4 button fw-bold" style="text-decoration: none;">Clear</a>
                </div>
                <div class="card mb-4">
                    <div v-for="(product, index) in order" :key="index" class="card-content p-0">
                        <div class="media">
                            <figure class="image is-96x96 pt-3">
                                <img :src="'http://localhost:3000' + product.menu_pic" alt="Placeholder image" />
                            </figure>
                            <div class="media-content pt-4 fw-bold fs-5">
                                {{ product.menu_name }}
                                <div style="display: flex;justify-content: space-between;">
                                    <div class="fw-bold fs-5">
                                        x {{ product.menu_quantity }}
                                    </div>
                                    <div class="d-flex flex-column justify-content-center align-items-center">
                                        <a class="button me-5 fw-bold" style="text-decoration: none; padding: 20px 50px 20px 50px;"
                                            @click="removeFromOrder(product, index)">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <label class="form-label fw-bold fs-5 mt-3 ms-2" v-if="showPrice">ราคารวม : {{ sum_price }} บาท</label>
                    <input class="button is-dark mt-3 fw-bold fs-3" style="width: 100%;color: white; text-decoration: none;"
                        @click="menuConfirm()" value="Ordered">
                </div>
            </div>
            <hr>
            <!-- ---------------------------------------------------------- -->
        </div>


    </div>
</template>
  
<script>

import axios from "axios";

// @ is an alias to /src
export default {
    name: "OrderPage",
    data() {
        return {
            menus: [],
            order: [],
            table: this.$route.query.table,
            sum_price: 0,
            showPrice: false,
        };
    },
    methods: {
        getMenu() {
            axios.get("http://localhost:3000/menu")
                .then(response => {
                    this.menus = response.data;
                })
                .catch(err => {
                    console.log(err);
                });
        },

        addToOrder(item) {
            this.showPrice = true;
            if (item.menu_quantity == 0) {
                this.order.push(item)
                item.menu_quantity++
            }
            else if (item.menu_quantity > 0) {
                item.menu_quantity++
            }
            this.sum_price += item.menu_price

        },

        removeFromOrder(item, indexs) {
            if (item.menu_quantity > 1) {
                item.menu_quantity--

            }
            else if (item.menu_quantity <= 1) {
                item.menu_quantity = 0
                this.order.splice(indexs, 1)
            }
            this.sum_price -= item.menu_price

            if (this.sum_price == 0) {
                this.showPrice = !this.showPrice;
            }
        },

        setZero() {
            this.order.forEach((item) => {
                item.menu_quantity = 0;
            })
            this.order = []
            this.sum_price = 0;
            this.showPrice = !this.showPrice;
        },

        menuConfirm() {
            if (this.order == "") {
                alert("กรุณาสั่งรายการอาหาร")
            }
            else {
                const result = window.confirm('ยืนยันที่จะสั่งรายการอาหารหรือไม่?');
                if (result) {
                    if (result) {
                        alert("รายการอาหารถูกสั่งเรียบร้อย")
                        console.log('saved')
                        const data = {  
                            order: this.order,
                            table: this.table,
                            sum_price: this.sum_price,
                        };
                        console.log(data)
                        axios.post("http://localhost:3000/order", data)
                            .then(response => {
                                this.$router.push({ path: '/confirm', query: { table: this.table } })
                                console.log(response.data);
                            })
                            .catch(err => {
                                console.log(err);
                            });
                    } else {
                        alert('คุณยกเลิกแล้ว');
                    }
                }
            }
        },
    },
    mounted() {
        this.getMenu();
    },
    watch: {
        '$route'(to, from) {
            this.previousRoutes.push(from) // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
        },
    },

};

</script>
  