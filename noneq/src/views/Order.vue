<template>
    <div id="app">

        <div class="columns">
            <div class="column is-8 pt-6">
                <div class="container is-max-desktop">
                    <div class="is-multiline columns is-variable is-2">

                        <div id="card_product" class="column is-one-quarter" v-for="(product, index) in menus" :key="index">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="require('@/assets/imagefood/SlicedPorkNeck.jpg')">  
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="fw-bold fs-4">
                                            {{ product.menu_name}}<br>
                                            {{ product.menu_price}} บาท
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <button type="button" class="btn btn-dark fw-bold fs-5"
                                            @click="addToOrder(product)">เพิ่มลงรายการอาหาร</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="column is-3 pt-6 pl-0 pr-5">
                <div style="display: flex;justify-content: space-between;">
                    <span class="title is-size-4 mb-4">รายการอาหารที่สั่ง</span>
                    <a @click="setZero()" class=" mb-4 button">Clear</a>
                </div>

                <div class="card mb-4">
                    <div class="card-content p-0">
                        <div class="media">
                            <div class="media-content pt-2">
                                <div style="display: flex;justify-content: space-between;">
                                    <div>
                                        <span></span>
                                    </div>
                                    <div>
                                        <span class="icon mr-2" @click="removeFromOrder(product, index)">
                                            <i class="far fa-trash-alt"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="button is-dark mt-3 fw-bold fs-4" style="width: 100%;color: white; text-decoration: none;"
                        @click="menuConfirm()">Confirm</a>
                </div>
            </div>

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
        };
    },
    methods: {
        getMenu() {
            axios.get("http://localhost:3000/menu",)
                .then(response => {
                    this.menus = response.data;
                })
                .catch(err => {
                    console.log(err);
                });
        },
    },
    mounted() {
        this.getMenu();
    },

};
</script>
  