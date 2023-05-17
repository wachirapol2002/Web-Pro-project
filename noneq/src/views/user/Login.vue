<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center bg-danger" style="min-height: 90vh;">
                <div class="text-white text-center mb-2">
                    <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                    NoneQ
                </div>
                <div class="login bg-light" style="width: 650px; border-radius: 10px;">
                    <form name="login" >
                        <div class="form-group" style="padding-left: 30px; padding-right: 30px;  padding-top: 20px;">
                            <label class="form-label" for="username">Username</label>
                            <input class="form-control" type="text" id="username" name="username" required placeholder="ชื่อผู้ใช้" maxlength="20" v-model="username">
                            <div class="invalid-feedback">
                                Please enter your username
                            </div>
                        </div>
    
                        <div class="form-group" style="padding-left: 30px; padding-right: 30px;">
                            <label class="form-label" for="password">Password</label>
                            <input class="form-control" :type="showPassword ? 'text' : 'password'" id="password" name="password" required placeholder="รหัสผ่าน" maxlength="20" v-model="password">
                            <div class="invalid-feedback">
                                Please enter your password
                            </div>
                        </div>
    
                        <div class="form-check" style="padding-left: 50px; padding-right: 30px;">
                            <input class="form-check-input" type="checkbox" id="check" v-model="showPassword">
                            <label class="form-check-label" style="font-size: 17px;" for="showpass">Show Password</label>
                        </div>
    
                        <div class="form-group d-flex justify-content-center">
                            <input class="btn btn-primary" type="submit" value="Sign In">
                        </div>

                        <div class="form-group justify-content-center text-center">
                            <label style="font-size: 17px;">Create an account</label>
                            <router-link to="/user/signup">
                                <a class="btn btn-link" value="Sign Up Now">Sign Up Now</a>
                            </router-link>
                        </div>
                        
                    </form>
                </div>
            </div>
    </div>
</template>

<script>
import axios from "axios";
// @ is an alias to /src
export default {
  name: "LoginPage",
  data() {
    return {
      username: '',
      password: '',
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
