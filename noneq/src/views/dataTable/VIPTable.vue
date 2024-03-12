<template>
  <div id="app">
    <div class="container-fluid p-4" style="min-height: 90vh">
      <div class="row mx-5">
        <h1>ข้อมูลสมาชิก VIP</h1>
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">ชื่อผู้ใช้</th>
            <th scope="col">expire_date</th>
            <th scope="col">สถานะ</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(member, index) in members" :key="member.VIP_id">
            <th scope="row">{{ index + 1 }}</th>
            <td>{{ member.username }}</td>
            <td>{{ formatTime(member.expire_date) }}</td>
            <td v-if="new Date(formatTime(member.expire_date)) < new Date()">
              หมดอายุ
            </td>
            <td v-else>ยังไม่หมดอายุ</td>
            <td>
              <div class="btn btn-danger" @click="retire(member.username)">
                ถอนสิทธิ์
              </div>
            </td>
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
      members: [],
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
        .get("http://44.206.165.83:3000/VIP")
        .then((response) => {
          this.members = response.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    retire(username) {
      const data = {
        username: username,
      };
      axios
        .post("http://44.206.165.83:3000/VIP/retire", data)
        .then((response) => {
          this.registers = response.data;
          window.location.reload();
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
