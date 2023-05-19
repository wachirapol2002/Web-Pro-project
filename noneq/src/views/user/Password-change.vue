<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="fw-bold text-center mb-2">
                <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                NoneQ
            </div>
                <div class="container-fluid bg-light px-5 py-4 border border-darkborder border-dark" style="width: 40vw; border-radius: 10px;">
                <h1 class="rounded-3">เปลี่ยนรหัสผ่าน</h1>
                <br>
                <form name="signup" >
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label fw-bold" for="username">Username</label>
                            <div class="mx-3">{{username}} </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label fw-bold" for="oldPassword">Old Password</label>
                            <input class="form-control" type="password" id="oldPassword" required placeholder="รหัสผ่านเก่า" maxlength="20" v-model="oldPassword">
                            <template v-if="$v.oldPassword.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.oldPassword.required">
                                    password is required
                                </p>
                            </template>
                            <p v-if="error" class="px-3 py-2 mb-3 alert alert-danger">
                              {{ error }}
                            </p>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label fw-bold" for="newPassword">New Password</label>
                            <input class="form-control" :type="showpassword ? 'text' : 'password'" id="newPassword" required placeholder="รหัสผ่านใหม่" maxlength="20" v-model="newPassword">
                            <template v-if="$v.newPassword.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.newPassword.required">
                                    New password is required
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.newPassword.minLength">
                                    Min 8 letters
                                </p>
                                <p class="text-danger m-0 p-0" v-if="!$v.newPassword.complex">
                                    Must have A-Z, a-z, 0-9
                                </p>
                            </template>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label fw-bold" for="confirmPassword">Confirm Password</label>
                            <input class="form-control" :type="showpassword ? 'text' : 'password'" id="confirmPassword" required placeholder="ยืนยันรหัสผ่าน" maxlength="20" v-model="confirmPassword">
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
                    
                    <div class="row my-2">
                      <div class="form-group d-flex justify-content-center">
                          <div class="btn btn-danger btn-md mt-4 mx-2" @click="back()">Cancel</div>
                          <div class="btn btn-dark btn-md mt-4 mx-2" @click="Update()">Confirm</div>
                      </div>
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
  minLength,
  sameAs,
} from "vuelidate/lib/validators";


function complexPassword(value) {
  if (value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/)) {
    return true;
  }
  return false;
}

export default {
  name: "PasswordChangePage",
  data() {
    return {
      previousRoutes: [],
      username: this.$cookies.get('account').username,
      oldPassword: "",
      newPassword: "",
      confirmPassword: "",
      showpassword: false,
      error: "",
      center:{
      'd-flex': true,
      'justify-content-center':true,
      'align-items-center':true
    },
    };
  },
  validations: {
    oldPassword: {
      required: required,
    },
    newPassword: {
      required: required,
      minLength: minLength(8),
      complex: complexPassword,
    },
    confirmPassword: {
      sameAs: sameAs("newPassword"),
    },
  },
  methods: {
    Update() {
      // Validate all fields
      this.$v.$touch();
      // เช็คว่าในฟอร์มไม่มี error
      if (!this.$v.$invalid) {
        const data = {
          username: this.username,
          oldPassword: this.oldPassword,
          newPassword: this.newPassword,
          confirmPassword: this.confirmPassword,
        };
        axios
          .post("http://localhost:3000/user/passwordChange", data)
          .then(() => {
            this.$router.push({path:'/'})
            alert("Updated");
          })
          .catch((error) => {
            this.error = error.response.data
            console.log(error.response.data)
          });
      }
    },
    back() {
      if (this.previousRoutes.length > 0) {
        const previousRoute = this.previousRoutes.pop()
        this.$router.push(previousRoute)
      } else {
        this.$router.go(-1)
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
