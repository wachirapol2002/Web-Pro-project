
<template>
    <div id="app">
        <div class="container-fluid p-4" style="min-height: 90vh;">
            <div class="row mx-5">
                <h1>ข้อมูลการจอง</h1>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">ชื่อผู้ใช้</th>
                        <th scope="col">เวลาที่จอง</th>
                        <th scope="col">หมายเลขโต๊ะ</th>
                        <th scope="col">time</th>
                    </tr>
                </thead>
                <tbody>
                    <tr  v-for="(booking,index) in bookings" :key="booking.booking_id">
                        <th scope="row">{{index+1}}</th>
                        <td>{{booking.username}}</td>
                        <td>{{booking.booking_time}}</td>
                        <td>{{booking.table_num}}</td>
                        <td>{{formatTime(booking.create_booking)}}</td>
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
  name: "BookingTable",
  data() {
    return {
      previousRoutes: [],
      bookings: [],
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
        this.checkhaveTable();
    }else{
        this.account = { username: "" };
    }
  },
  methods: {
    getData() {
      axios.get("http://localhost:3000/booking")
        .then(response => {
          this.bookings = response.data;
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
