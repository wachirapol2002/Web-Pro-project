
<template>
    <div id="app">
        <div class="container" style="min-height: 90vh;">
            <div class="col-12" :class="center">
                <img :src="require('@/assets/promptpay.png')" style="height: 300px;">
            </div>
            <section class="hero" :class="center">
            <div class="hero-body" >
                <p class="title">ค่าธรรมเนียมสมัครสมาชิกกับทางร้าน 500 บาท</p>
                <p class="h3">-จองโต๊ะไม่ต้องรอหน้าร้าน</p>
                <p class="h3">-ลดราคาเมื่อชำระเงิน 10%</p>
            </div>
            </section>
            <section class="container" :class="center">
                <div class="content">
                    <label class="label">transfer slip</label>
                    <div class="file">
                    <label class="file-label">
                        <input class="file-input" type="file" id="file" ref="file" @change="handleFileUpload()">
                        <span class="file-cta">
                            <span class="file-icon">
                                <i class="bi bi-upload"></i>
                            </span>
                            <span class="file-label">
                                Choose an image
                            </span>
                        </span>
                    </label>
                    </div>
                    <p v-if="error" class="px-3 py-2 my-3 alert alert-danger">
                            {{ error }}
                    </p>
                    <div class="field is-grouped mt-3">
                        <div class="control">
                            <input type="button" class="btn btn-success" value="submit" @click="submit()">
                        </div>
                        <div class="control">
                            <button class="btn btn-dark" @click="back()">Back</button>
                        </div>
                    </div>
                </div>
            </section>
      </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
  name: "registerVIP",
  data() {
    return {
      previousRoutes: [],
      bookings: [],
      account: { username: "" },
      file: null,
      error: null,
      center:{
        'd-flex': true,
        'justify-content-center':true,
        'align-items-center':true
      },
    };
  },
  mounted() {
    if(this.$cookies.isKey('account')){
        this.account = this.$cookies.get('account')
    }else{
        this.account = { username: "" };
    }
  },
  methods: {
    handleFileUpload(){
        this.file = this.$refs.file.files[0];
    },
    submit(){
        var formData = new FormData();
        formData.append("image", this.file);
        formData.append("username", this.account.username);
        axios.post('http://localhost:3000/registerVIP', formData, {
            headers: {
            'Content-Type': 'multipart/form-data'
            }
        }).then(response => {
            alert("รอพนักงานตรวจสอบ")
            this.$router.push({path: '/tables'}) // Success! -> redirect to home page
            console.log(response)
        })
        .catch(error => {
            this.error = error.response.data
        });
    },
    back() {
        if (this.previousRoutes.length > 0) {
            const previousRoute = this.previousRoutes.pop()
            this.$router.push(previousRoute)
        } else {
            this.$router.go(-1)
        }
    },
  }
    
};
</script>
