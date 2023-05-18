<template>
  <div id="app">
    <div class="container-fluid d-flex flex-column justify-content-center align-items-center"
      style="min-height: 90vh; background-color: rgb(84, 84, 84);">

      <div class="d-flex flex-column align-items-center fw-bold text-white">
        <p class="h1 position-absolute" style=" font-size: 70px;"><i>W e l c o m e</i><i class="fa-solid fa-fork"></i></p>
        <img :src="require('@/assets/NoneQ.png')" style="width: 650px; border-radius: 50%;">
        


        <div class="position-absolute" style="border-top: 5px solid white; border-bottom: 5px solid white; margin-top: 450px;">
          <router-link to="">
          <button class="btn fw-bold text-white ps-5 pe-5 " style="font-size: 60px;"
          :style="{backgroundColor: isHover ? 'rgb(110, 110, 110, 0.5)': 'rgb(84, 84, 84)'}" @mouseover="isHover = true"
          @mouseleave="isHover = false">
            <i><i class="bi bi-chevron-double-right"></i> NoneQ Store <i class="bi bi-chevron-double-left"></i></i>
            <i><p class="h6">Enter Here</p></i>
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
      isHover: false,
      search: "",
      tables: [],
      center: {
        'd-flex': true,
        'justify-content-center': true,
        'align-items-center': true
      },
    };
  },
  mounted() {
    this.getTables();
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


