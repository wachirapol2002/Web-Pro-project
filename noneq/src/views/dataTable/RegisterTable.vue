
<template>
    <div id="app">
        <div class="container-fluid p-4" style="min-height: 90vh;">
            <div class="row mx-5">
                <h1>ข้อมูลสมาชิก VIP</h1>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">ชื่อผู้ใช้</th>
                        <th scope="col">รูปภาพยืนยัน</th>
                        <th scope="col">วันที่อัปโหลด</th>
                        <th scope="col">ยืนยันสิทธิ์</th>
                    </tr>
                </thead>
                <tbody>
                    <tr  v-for="(register,index) in registers" :key="register.image_id">
                        <th scope="row">{{index+1}}</th>
                        <td>{{register.username}}</td>
                        <td><img :src="'http://localhost:3000/static'+register.file_path" alt="Placeholder image" style="max-width: 100px"></td>
                        <td>{{formatTime(register.upload_date)}}</td>
                        <td v-if="register.confirm == 'NO'"><div class="btn btn-success" @click="confirm(register.username,register.image_id)">ยืนยัน</div></td>
                        <td v-else>ยืนยันแล้ว</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import dayjs from 'dayjs'
import axios from "axios";
export default {
  name: "RegisterTable",
  data() {
    return {
      previousRoutes: [],
      registers: [],
      account: { username: "" },
      center:{
        'd-flex': true,
        'justify-content-center':true,
        'align-items-center':true
      },
    };
  },
  mounted() {
    this.getData();
    if(this.$cookies.isKey('account')){
        this.account = this.$cookies.get('account')
    }else{
        this.account = { username: "" };
    }
  },
  methods: {
    getData() {
      axios.get("http://localhost:3000/registerVIP")
        .then(response => {
          this.registers = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    confirm(username,img_id) {
        const data = {
          username: username,
          image_id: img_id,
        };
        axios.post("http://localhost:3000/registerVIP/confirm",data)
        .then(response => {
          this.registers = response.data;
          window.location.reload();
        })
        .catch(err => {
          console.log(err);
        });
    },
    formatTime(time) {
      return dayjs(time).format('YYYY-MM-DD HH:mm:ss');
    },
  },
    
};
</script>
