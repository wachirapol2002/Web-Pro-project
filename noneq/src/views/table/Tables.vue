<style>
.test{
    height: 50px;
    width: 50px;
    background: red;
}
.grid{
    display: grid;
    grid-template-columns: auto auto auto auto auto;
    gap: 10vh;
    padding: 10px;
}
.tables{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;
    width:7vw;
    height: 4vw;
}
.available{
    background-color: green;
}
.booked{
    background-color: rgb(255, 183, 0);
}
.unavailable{
    background-color: red;
}

</style>

<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="grid">
                <div :class="center" v-for="table in tables" :key="table.table_num">
                    <div class="tables" :class="{
                        'available': (table.table_status == 'available' || table.username == null),
                        'booked': (table.table_status == 'booked' && table.username == this.username.username),
                        'unavailable': (table.table_status == 'unavailable' && table.username != this.username.username)}">
                        {{table.table_num}}
                    </div>
                </div>
            </div>	
        </div>
    </div>
</template>

<script>
import axios from "axios";
import {required,} from "vuelidate/lib/validators";
export default {
  name: "LoginPage",
  data() {
    return {
      previousRoutes: [],
      tables: [],
      username: '',
      password: '',
      showpassword: false,
      error: '',
      center:{
        'd-flex': true,
        'justify-content-center':true,
        'align-items-center':true
      },
    };
  },
  mounted() {
    this.getTables();
    if(this.$cookies.isKey('account')){
        this.username = this.$cookies.get('account')
    }else{
        this.username = ""
    }
  },
  methods: {
    getTables() {
      axios.get("http://localhost:3000")
        .then(response => {
          this.tables = response.data;
          console.log(this.tables)
        })
        .catch(err => {
          console.log(err);
        });
    },
  },
  validations: {
    username: {
      required: required,
    },
    password: {
      required: required,
    },
  },
};
</script>
