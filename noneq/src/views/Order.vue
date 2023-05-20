<template>
    <div id="app">

        <div class="columns">
            <div class="column is-8 pt-6">
                <div class="container is-max-desktop">
                    <div class="is-multiline columns is-variable is-2">

                        <div id="card_product" class="column is-one-quarter" v-for="product in menus" :key="product.menu_id">
                            <div class="card">
                                <div class="card-image" >
                                    <figure class="image is-1by1" >
                                        <img :src="'http://localhost:3000'+product.menu_pic" alt="Placeholder image"/>
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
                                        <input type="button" class="btn btn-dark fw-bold fs-5" value="เพิ่มลงรายการอาหาร"
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
                    <a @click="setZero()" class=" mb-4 button" style="text-decoration: none;">Clear</a>
                </div>
                <div class="card mb-4">
                    <div v-for="(product, index) in order" :key="index" class="card-content p-0">
                        <div class="media">
                            <figure class="image is-96x96 pt-3">
                                <img :src="'http://localhost:3000'+product.menu_pic" alt="Placeholder image"/>
                            </figure>
                            <div class="media-content pt-4 fw-bold">
                                {{ product.menu_name }}
                                <div style="display: flex;justify-content: space-between;">
                                    <div class="fw-bold ">
                                        X 0
                                    </div>
                                    <div>
                                        <a class="button me-5" style="text-decoration: none;" @click="removeFromOrder(product, index)">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <label class="form-label fw-bold fs-5 mt-3 ms-2" for="date">ราคารวม : </label>
                    <a class="button is-dark mt-3 fw-bold fs-4" style="width: 100%;color: white; text-decoration: none;"
                        @click="menuConfirm()">สั่งอาหาร</a>
                </div>
            </div>
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
            quantity: 0,
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
            if (this.quantity == 0) {
                this.order.push(item)
                item.quantity++
            }
            else if (this.quantity > 0) {
                item.quantity++
            }

        },
        menuConfirm() {
            if (this.order == "") {
                alert("กรุณาสั่งรายการอาหาร")
            }
            else {

                // const data = {
                //     order_details_id: "",
                //     order_id: "",
                //     menu_id: "",
                //     quantity: 0,
                //     quantity_price: 0,
                // };
                // axios.post("http://localhost:3000/order", data)
                //     .then(response => {
                //         console.log(response.data);
                //     })
                //     .catch(err => {
                //         console.log(err);
                //     });

                alert("รายการอาหารถูกสั่งเรียบร้อย")
                console.log('saved')
                this.$router.push({ path: '/confirm' })
            }
        },
    },
    mounted() {
        this.getMenu();
    },

};
</script>
  