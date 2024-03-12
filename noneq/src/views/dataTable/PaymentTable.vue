<template>
  <div id="app">
    <div class="container-fluid p-4" style="min-height: 90vh">
      <div class="row mx-5">
        <h1>ข้อมูลการจ่ายเงิน</h1>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">ชื่อผู้ใช้</th>
            <th scope="col">หมายเลขโต๊ะ</th>
            <th scope="col">ราคารวม</th>
            <th scope="col">เวลาออก Bill</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(payment, index) in payments" :key="payment.payment_id">
            <th scope="row">{{ index + 1 }}</th>
            <td>{{ payment.username }}</td>
            <td>{{ payment.table_num }}</td>
            <td>{{ payment.total_price }}</td>
            <td>{{ formatTime(payment.payment_time) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import dayjs from "dayjs";
import axios from "axios";
export default {
  name: "PaymentTable",
  data() {
    return {
      previousRoutes: [],
      payments: [],
      account: { username: "" },
      center: {
        "d-flex": true,
        "justify-content-center": true,
        "align-items-center": true,
      },
    };
  },
  mounted() {
    this.getData();
    if (this.$cookies.isKey("account")) {
      this.account = this.$cookies.get("account");
    } else {
      this.account = { username: "" };
    }
  },
  methods: {
    getData() {
      axios
        .get("http://44.206.165.83:3000/payments")
        .then((response) => {
          this.payments = response.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    formatTime(time) {
      return dayjs(time).format("YYYY-MM-DD HH:mm:ss");
    },
  },
};
</script>
