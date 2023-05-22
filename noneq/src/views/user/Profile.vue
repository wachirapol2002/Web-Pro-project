<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="fw-bold text-center mb-2">
                <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                NoneQ
            </div>
                <div class="container-fluid bg-light px-5 py-4 border border-dark" style="width: 40vw; border-radius: 10px;">
                <h1 class="rounded-3">ข้อมูลบัญชี</h1>
                <br>
                <form name="signup" >
                    <div class="row my-2">
                        <div class="form-group col-12">
                            <label class="form-label fw-bold" for="username">Username</label>
                            <div class="mx-3">{{username}} </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="firstname">Firstname</label>
                            <div class="mx-3">{{firstname}} </div>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="lastname">Lastname</label>
                            <div class="mx-3">{{lastname}} </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="email">E-mail</label>
                            <div class="mx-3">{{email}} </div>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="phone">Phone</label>
                            <div class="mx-3">{{phone}} </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="permission">Permission</label>
                            <div class="mx-3">{{permission}} </div>
                        </div>
                        <div class="form-group col-6" v-if="this.$cookies.get('account').permission=='VIP'">
                            <label class="form-label fw-bold" for="permission">expire</label>
                            <div class="mx-3">{{formatTime(expire_date.expire_date)}} </div>
                        </div>
                    </div>
                    

                    <div class="row my-2">
                        <div class="form-group d-flex justify-content-center">
                            <div class="btn btn-dark btn-md mt-4 mx-2"  @click="back()">Back</div>
                            <router-link to="/user/Profile-edit">
                            <div class="btn btn-dark btn-md mt-4 mx-2">Edit</div>
                            </router-link>
                        </div>
                    </div>

                </form>
            </div>  
        </div>
    </div>
</template>

<script>
import dayjs from 'dayjs'
import axios from "axios";
export default {
  name: "ProfilePage",
  data() {
    return {
    previousRoutes: [],
    account: { username: "" },
    username: this.$cookies.get('account').username,
    firstname: this.$cookies.get('account').firstname,
    lastname: this.$cookies.get('account').lastname,
    email: this.$cookies.get('account').email,
    phone: this.$cookies.get('account').phone,
    permission: this.$cookies.get('account').permission,
    expire_date: null,
    center:{
    'd-flex': true,
    'justify-content-center':true,
    'align-items-center':true
    },
    };
  },
  methods: {
    back() {
        if (this.previousRoutes.length > 0) {
            const previousRoute = this.previousRoutes.pop()
            this.$router.push(previousRoute)
        } else {
            this.$router.go(-1)
        }
    },
    expire(){
        axios.get("http://localhost:3000/VIP/"+this.$cookies.get('account').username)
        .then(response => {
        console.log(response.data)
          this.expire_date = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    formatTime(time) {
      return dayjs(time).format('YYYY-MM-DD HH:mm:ss');
    },
  },
  watch: {
    '$route'(to, from) {
        this.previousRoutes.push(from) // เมื่อมีการเปลี่ยนเส้นทางใหม่ ให้เก็บเส้นทางก่อนหน้าลงในอาร์เรย์
    },
  },
  mounted() {
    if(this.$cookies.isKey('account')){
        this.account = this.$cookies.get('account')
        if(this.$cookies.get('account').permission == "VIP"){
            this.expire()
        }
    }else{
        this.account = { username: "" };
    }
  },
    
};
</script>
