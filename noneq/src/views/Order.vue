<template>
    <div id="app">

        <div class="columns">
            <div class="column is-8 pt-6">
                <div class="container is-max-desktop">
                    <div class="is-multiline columns is-variable is-2">

                        <div id="card_product" class="column is-one-quarter">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="require('@/assets/logo.png')" style="width:100%; height: 100%;">
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="media-content">
                                            <p class="title is-4">สันคอหมู</p>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <button type="button" class="btn btn-dark"
                                            @click="addToOrder(product)">เพิ่มลงรายการอาหาร</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- <div id="card_product" class="column is-one-quarter">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="require('@/assets/logo.png')" style="width:100%; height: 100%;">
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="media-content">
                                            <p class="title is-4">สันคอหมู</p>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <button type="button" class="btn btn-dark"
                                            @click="addToOrder(product)">เพิ่มลงรายการอาหาร</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="card_product" class="column is-one-quarter">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="require('@/assets/logo.png')" style="width:100%; height: 100%;">
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="media-content">
                                            <p class="title is-4">สันคอหมู</p>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <button type="button" class="btn btn-dark"
                                            @click="addToOrder(product)">เพิ่มลงรายการอาหาร</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="card_product" class="column is-one-quarter">
                            <div class="card">
                                <div class="card-image">
                                    <figure class="image is-1by1">
                                        <img :src="require('@/assets/logo.png')" style="width:100%; height: 100%;">
                                    </figure>
                                </div>
                                <div class="card-content">
                                    <div class="media">
                                        <div class="media-content">
                                            <p class="title is-4">สันคอหมู</p>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <button type="button" class="btn btn-dark"
                                            @click="addToOrder(product)">เพิ่มลงรายการอาหาร</button>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        
                    </div>
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
            search: "",
            tables: [],
            center: {
                'd-flex': true,
                'justify-content-center': true,
                'align-items-center': true
            },
        };
    },
    methods: {
        getTables() {
            axios.get("http://localhost:3000", {
                params: {
                    search: this.search
                }
            })
                .then(response => {
                    this.tables = response.data;
                })
                .catch(err => {
                    console.log(err);
                });
        },
    }

};
</script>
  