<template>
    <div id="app">
        <div class="container-fluid" :class="center" style="background-color: rgb(84, 84, 84);">
            <img style="width: 47%;" :src="require('../assets/NoneQ.png')" alt="">
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
      search: "",
      tables: [],
      center:{
      'd-flex': true,
      'justify-content-center':true,
      'align-items-center':true
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
