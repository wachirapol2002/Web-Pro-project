<template>
  <div id="app">
    <div
      class="container-fluid d-flex flex-column justify-content-center align-items-center"
      style="min-height: 90vh"
    >
      <div class="fw-bold text-center mb-2">
        <img
          :src="require('@/assets/logo.png')"
          style="width: 80px; border-radius: 50%"
        /><br />
        NoneQ
      </div>
      <div
        class="container-fluid bg-light px-5 py-4 border border-darkborder border-dark"
        style="width: 40vw; border-radius: 10px"
      >
        <h1 class="rounded-3">แก้ไขข้อมูลบัญชี</h1>
        <br />
        <form name="signup">
          <div class="row my-2">
            <div class="form-group col-12">
              <label class="form-label fw-bold" for="username">Username</label>
              <div class="mx-3">{{ username }}</div>
            </div>
          </div>
          <div class="row my-2">
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="firstname"
                >Firstname</label
              >
              <input
                class="form-control"
                :class="{ 'border-danger': $v.firstname.$error }"
                type="text"
                id="firstname"
                required
                placeholder="ชื่อจริง"
                maxlength="100"
                v-model="firstname"
              />
              <template v-if="$v.firstname.$error">
                <p class="text-danger m-0 p-0" v-if="!$v.firstname.required">
                  This field is required
                </p>
              </template>
            </div>
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="lastname">Lastname</label>
              <input
                class="form-control"
                :class="{ 'border-danger': $v.lastname.$error }"
                type="text"
                id="lastname"
                required
                placeholder="นามสกุล"
                maxlength="100"
                v-model="lastname"
              />
              <template v-if="$v.lastname.$error">
                <p class="text-danger m-0 p-0" v-if="!$v.lastname.required">
                  This field is required
                </p>
              </template>
            </div>
          </div>
          <div class="row my-2">
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="email">E-mail</label>
              <input
                class="form-control"
                :class="{ 'border-danger': $v.email.$error }"
                type="email"
                id="email"
                required
                placeholder="อีเมล"
                maxlength="100"
                v-model="email"
              />
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
              <label class="form-label fw-bold" for="phone">Phone</label>
              <input
                class="form-control"
                :class="{ 'border-danger': $v.phone.$error }"
                type="text"
                id="phone"
                required
                placeholder="08xxxxxxxx"
                maxlength="10"
                v-model="phone"
              />
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
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="permission"
                >Permission</label
              >
              <div class="mx-3">{{ permission }}</div>
            </div>
            <div class="form-group col-6">
              <router-link to="/user/change-password">
                <br /><label class="form-label fw-bold" for="permission"
                  >change password</label
                >
              </router-link>
            </div>
          </div>

          <div class="row my-2">
            <div class="form-group d-flex justify-content-center">
              <div class="btn btn-dark btn-md mt-4 mx-2" @click="back()">
                Back
              </div>
              <div class="btn btn-dark btn-md mt-4 mx-2" @click="save()">
                Save
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { required, email, helpers } from "vuelidate/lib/validators";

function phone(value) {
  return !helpers.req(value) || !!value.match(/0[0-9]{9}/);
}

export default {
  name: "ProfileEditPage",
  data() {
    return {
      previousRoutes: [],
      username: this.$cookies.get("account").username,
      firstname: this.$cookies.get("account").firstname,
      lastname: this.$cookies.get("account").lastname,
      email: this.$cookies.get("account").email,
      phone: this.$cookies.get("account").phone,
      permission: this.$cookies.get("account").permission,
      center: {
        "d-flex": true,
        "justify-content-center": true,
        "align-items-center": true,
      },
    };
  },
  validations: {
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
  },
  methods: {
    save() {
      // Validate all fields
      this.$v.$touch();
      // เช็คว่าในฟอร์มไม่มี error
      if (!this.$v.$invalid) {
        const data = {
          username: this.username,
          firstname: this.firstname,
          lastname: this.lastname,
          email: this.email,
          phone: this.phone,
        };
        axios
          .post("http://44.206.165.83:3000/user/edit", data)
          .then((res) => {
            const account = {
              username: res.data.account.username,
              permission: res.data.account.permission,
              firstname: res.data.account.firstname,
              lastname: res.data.account.lastname,
              email: res.data.account.email,
              phone: res.data.account.phone,
            };
            this.$cookies.set("account", account);
            this.$router.push({ path: "/user/Profile" });
            alert("Updated");
          })
          .catch((err) => {
            alert(err.response.data.details.message);
          });
      }
    },
    back() {
      if (this.previousRoutes.length > 0) {
        const previousRoute = this.previousRoutes.pop();
        this.$router.push(previousRoute);
      } else {
        this.$router.go(-1);
      }
    },
  },
  watch: {
    $route(to, from) {
      this.previousRoutes.push(from); // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
    },
  },
};
</script>
