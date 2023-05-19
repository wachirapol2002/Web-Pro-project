<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="fw-bold text-center mb-2">
                <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                NoneQ
            </div>
            <div class="container-fluid bg-light px-5 py-4 border border-dark" style="width: 40vw; border-radius: 10px;">
                <h1 class="rounded-3">เข้าสู่ระบบ</h1>
                <br>
                <form name="signup" >
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label" for="username">Username</label>
                            <input class="form-control" type="text" id="username" name="username" required placeholder="ชื่อผู้ใช้" maxlength="20" v-model="username">
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label" for="password">Password</label>
                            <input class="form-control" :type="showpassword ? 'text' : 'password'" id="password" required placeholder="รหัสผ่าน" maxlength="20" v-model="password">
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input class="form-check-input" type="checkbox" id="check" v-model="showpassword">
                        <label class="form-check-label" style="font-size: 17px;" for="showpass">Show Password</label>
                    </div>
                    <p v-if="error" class="px-3 py-2 mb-3 alert alert-danger">
                      {{ error }}
                    </p>
                        <div class="form-group d-flex justify-content-center">
                            <div class="btn btn-dark btn-md mt-4 mx-2" @click="submit()">Sign In</div>
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
import {required,} from "vuelidate/lib/validators";
export default {
  name: "LoginPage",
  data() {
    return {
      previousRoutes: [],
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
  methods: {
    submit () {
      this.$v.$touch();
      if (!this.$v.$invalid) {
        const data = {
          username: this.username,
          password: this.password
        }
        axios.post('http://localhost:3000/user/login/', data)
          .then(res => {
            const account = {
              username: res.data.account.username,
              permission: res.data.account.permission,
              firstname: res.data.account.firstname,
              lastname: res.data.account.lastname,
              email: res.data.account.email,
              phone: res.data.account.phone,
            }
            this.$cookies.set('account', account)
            alert("Login Success");
            this.$router.push({path: '/'})
            console.log(this.$cookies.get('account'))
            console.log(this.$cookies.keys())
            
          })
          .catch(error => {
            this.error = error.response.data
            console.log(error.response.data)
          })
      }
    }
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
