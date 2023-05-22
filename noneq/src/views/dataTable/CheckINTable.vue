
<template>
    <div id="app">
        <div class="container-fluid p-4" style="min-height: 90vh;">
            <div class="row mx-5">
                <h1>ข้อมูลการเข้าใช้โต๊ะ</h1>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">ชื่อผู้ใช้</th>
                        <th scope="col">หมายเลขโต๊ะ</th>
                        <th scope="col">เวลาเข้า</th>
                        <th scope="col">เวลาออก</th>
                    </tr>
                </thead>
                <tbody>
                    <tr  v-for="(checkin,index) in checkins" :key="checkin.checkIN">
                        <th scope="row">{{index+1}}</th>
                        <td>{{checkin.username}}</td>
                        <td>{{checkin.table_num}}</td>
                        <td>{{formatTime(checkin.checkIN_time)}}</td>
                        <td v-if="checkin.checkOut_time != null">{{formatTime(checkin.checkOut_time)}}</td>
                        <td v-else>ใช้บริการอยู่</td>
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
  name: "CheckInTable",
  data() {
    return {
      previousRoutes: [],
      checkins: [],
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
      axios.get("http://localhost:3000/checkin")
        .then(response => {
          this.checkins = response.data;
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
