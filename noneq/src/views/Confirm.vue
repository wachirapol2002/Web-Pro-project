<template>
  <div id="app">

    <div class="container is-max-desktop p-5 ">
      <div class="column pt-2 pl-0 pr-0">
        <div class="card mb-1">
          <div class="card-content p-0">
            <div class="media">
              <div class="media-left">
                <figure class="image is-96x96">
                  <!-- <img :src="require('../assets/imagefood/SlicedPorkNeck.jpg')"> -->
                </figure>
              </div>
              <div class="media-content pt-2">
                <p class="title is-5">asdad</p>
                <p class="has-text-grey-light is-6">asdasd</p>
                <div style="display: flex;justify-content: space-between;">
                  <div>
                    <span>x</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><router-link to="/tables">
      <a class="button is-dark mt-3 fw-bold fs-5" style="width: 100%;color: white; text-decoration: none;" @click="menuConfirm()">Home</a>
    </router-link>
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
      center: {
        'd-flex': true,
        'justify-content-center': true,
        'align-items-center': true
      },
    };
  },
  methods: {
    getTables() {
      axios.get("http://localhost:3000/Confirm", {
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
  },
  watch: {
    '$route'(to, from) {
      this.previousRoutes.push(from) // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
    },
  },

};
</script>
