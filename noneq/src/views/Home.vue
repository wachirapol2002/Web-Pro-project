<template>
  <div id="app">
    <div class="position-absolute">
      <div class="position-inline row">
        <div class="col-md-6">
          <img
            :src="require('@/assets/res_pic1.jpg')"
            style="width: 100vw; min-height: 100vh; opacity: 0.8"
          />
        </div>
        <div class="col-md-6">
          <img
            :src="require('@/assets/res_pic2.jpg')"
            style="width: 100vw; min-height: 100vh; opacity: 0.8"
          />
        </div>
      </div>
    </div>
    <div
      class="position-absolute container-fluid d-flex flex-column justify-content-center align-items-center"
    >
      <div
        class="d-flex flex-column align-items-center fw-bold text-white pt-5"
        style="
          background-color: rgb(84, 84, 84);
          border-left: 8px solid white;
          border-right: 8px solid white;
          height: 100vh;
        "
      >
        <p class="h1 position-absolute pt-5" style="font-size: 70px">
          <i>W e l c o m e </i>
        </p>
        <img
          :src="require('@/assets/NoneQ.png')"
          style="width: 650px; border-radius: 50%"
        />
        <div
          class="position-absolute"
          style="
            border-top: 5px solid white;
            border-bottom: 5px solid white;
            margin-top: 450px;
          "
        >
          <router-link to="/tables">
            <button
              class="btn fw-bold text-white ps-5 pe-5"
              style="font-size: 60px"
              :style="{
                backgroundColor: isHover
                  ? 'rgb(110, 110, 110, 0.5)'
                  : 'rgb(84, 84, 84)',
              }"
              @mouseover="isHover = true"
              @mouseleave="isHover = false"
            >
              <i
                ><i class="bi bi-chevron-double-right"></i> NoneQ Store
                <i class="bi bi-chevron-double-left"></i
              ></i>
              <i>
                <p class="h6">Enter Here</p>
              </i>
            </button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

// @ is an alias to /src
export default {
  name: "HomePage",
  data() {
    return {
      previousRoutes: [],
      isHover: false,
      search: "",
      tables: [],
      center: {
        "d-flex": true,
        "justify-content-center": true,
        "align-items-center": true,
      },
    };
  },
  mounted() {
    this.getTables();
  },
  methods: {
    getTables() {
      axios
        .get("http://44.206.165.83:3000", {
          params: {
            search: this.search,
          },
        })
        .then((response) => {
          this.tables = response.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  watch: {
    $route(to, from) {
      this.previousRoutes.push(from); // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
    },
  },
};
</script>
