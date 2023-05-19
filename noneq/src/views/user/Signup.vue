<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="fw-bold text-center mb-2">
                <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                NoneQ
            </div>
            <div class="container-fluid bg-light px-5 py-4 border border-dark" style="width: 40vw; border-radius: 10px;">
                <h1 class="rounded-3">สมัครบัญชี</h1>
                <br>
                <form name="signup" >
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label" for="username">Username*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.username.$error }" type="text" id="username" name="username" required placeholder="ชื่อผู้ใช้" maxlength="20" v-model="username">
                            <template v-if="$v.username.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.username.required">
                                    This field is required
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.username.minLength">
                                    Min 5 letters
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.username.maxLength">
                                    Max 20 letters
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label" for="firstname">Firstname*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.firstname.$error }" type="text" id="firstname" required placeholder="ชื่อจริง" maxlength="100" v-model="firstname">
                            <template v-if="$v.firstname.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.firstname.required">
                                    This field is required
                                </p>
                            </template>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label" for="lastname">Lastname*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.lastname.$error }" type="text" id="lastname" required placeholder="นามสกุล" maxlength="100" v-model="lastname">
                            <template v-if="$v.lastname.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.lastname.required">
                                    This field is required
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label" for="email">E-mail*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.email.$error }" type="email" id="email" required placeholder="อีเมล" maxlength="100" v-model="email">
                            <template v-if="$v.email.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.email.required">
                                    This field is required
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.email.email">
                                    Enter your email correctly
                                </p>
                            </template>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label" for="phone">Phone*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.phone.$error }" type="text" id="phone" required placeholder="08xxxxxxxx" maxlength="10" v-model="phone">
                            <template v-if="$v.phone.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.phone.required">
                                    This field is required
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.phone.phone">
                                    Enter your phone number correctly
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label" for="password">Password*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.password.$error }" :type="showpassword ? 'text' : 'password'" id="password" required placeholder="รหัสผ่าน" maxlength="20" v-model="password">
                            <template v-if="$v.password.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.password.required">
                                    This field is required
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.password.minLength">
                                    Min 8 letters
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.password.complex">
                                    Must have A-Z, a-z, 0-9
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label" for="confirmPassword">Confirm Password*</label>
                            <input class="form-control" :class="{ 'border-danger': $v.confirmPassword.$error }" :type="showpassword ? 'text' : 'password'" id="confirmPassword" name="password" required placeholder="ยืนยันรหัสผ่าน" maxlength="20" v-model="confirmPassword">
                            <template v-if="$v.confirmPassword.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.confirmPassword.sameAs">
                                    Must same password
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input class="form-check-input" type="checkbox" id="check" v-model="showpassword">
                        <label class="form-check-label" style="font-size: 17px;" for="showpass">Show Password</label>
                    </div>
                    
                    <div class="form-group d-flex justify-content-center">
                        <div class="btn btn-dark btn-md mt-4 mx-2" @click="submit()">Sign Up</div>
                    </div>

                    <div class="form-group justify-content-center text-center">
                        <label style="font-size: 17px;">Already Have an account?</label>
                        <router-link to="/user/login">
                            <a class="btn btn-link" value="Sign In">Sign In</a>
                        </router-link>
                    </div>
                </form>
            </div>  
        </div>
    </div>
</template>

<script>
import axios from "axios";
import {
  required,
  email,
  minLength,
  maxLength,
  sameAs,
  helpers,
} from "vuelidate/lib/validators";

function phone(value) {
  return !helpers.req(value) || !!value.match(/0[0-9]{9}/);
}

function complexPassword(value) {
  if (value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/)) {
    return true;
  }
  return false;
}

export default {
  name: "SignupPage",
  data() {
    return {
      previousRoutes: [],
      username: "",
      password: "",
      confirmPassword: "",
      email: "",
      phone: "",
      firstname: "",
      lastname: "",
      showpassword: false,
      center:{
      'd-flex': true,
      'justify-content-center':true,
      'align-items-center':true
    },
    };
  },
  validations: {
    username: {
      required: required,
      minLength: minLength(5),
      maxLength: maxLength(20),
    },
    firstname: {
      required: required,
    },
    lastname: {
      required: required,
    },
    email: {
      required: required,
      email: email,
    },
    phone: {
      required: required,
      phone: phone,
    },
    password: {
      required: required,
      minLength: minLength(8),
      complex: complexPassword,
    },
    confirmPassword: {
      sameAs: sameAs("password"),
    },
  },
  methods: {
    submit() {
      // Validate all fields
      this.$v.$touch();
      // เช็คว่าในฟอร์มไม่มี error
      if (!this.$v.$invalid) {
        const data = {
          username: this.username,
          password: this.password,
          confirmPassword: this.confirmPassword,
          firstname: this.firstname,
          lastname: this.lastname,
          email: this.email,
          phone: this.phone,
        };
        axios
          .post("http://localhost:3000/user/signup", data)
          .then(() => {
            this.$router.push({path:'/user/login'})
            alert("Sign up Success");
          })
          .catch((err) => {
            console.log(err)
            alert(err.response.data.details.message)
          });
      }
    },
  },
  watch: {
    '$route'(to, from) {
        this.previousRoutes.push(from) // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
    },
  },
};
</script>
