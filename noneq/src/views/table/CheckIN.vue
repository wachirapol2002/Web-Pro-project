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
        <template v-if="this.account.permission == 'staff'">
          <h1 class="rounded-3">Check-In</h1>
        </template>
        <template v-else>
          <h1 class="rounded-3">จองโต๊ะ</h1>
        </template>
        <br />
        <form name="signup">
          <div class="row my-2">
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="username">เลขโต๊ะ </label>
              <div class="mx-3">{{ this.$route.query.table }}</div>
            </div>
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="username">ผู้จอง</label>
              <div class="mx-3">{{ this.bookData.username }}</div>
            </div>
          </div>
          <div class="row my-2">
            <div class="form-group col-6">
              <label class="form-label fw-bold" for="time">เวลา</label>
              <div class="mx-3">
                {{ this.bookData.booking_time.slice(0, 5) }}
              </div>
            </div>
          </div>
          <div class="row my-2">
            <div class="form-group d-flex justify-content-center">
              <div class="btn btn-dark btn-md mt-4 mx-2" @click="back()">
                Back
              </div>

              <template v-if="this.table.table_status == 'booked'">
                <div class="btn btn-danger btn-md mt-4 mx-2" @click="cancel()">
                  Cancel
                </div>
              </template>

              <template v-if="this.account.permission == 'staff'">
                <div
                  class="btn btn-success btn-md mt-4 mx-2"
                  @click="checkin()"
                >
                  Check-IN
                </div>
              </template>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

function formatTime(date) {
  const hours = date.getHours().toString().padStart(2, "0");
  const minutes = date.getMinutes().toString().padStart(2, "0");
  return `${hours}:${minutes}`;
}

export default {
  name: "CheckINPage",
  data() {
    return {
      previousRoutes: [],
      account: this.$cookies.get("account"),
      username: this.$cookies.get("account").username,
      table: {},
      bookData: {
        username: "table" + this.$route.query.table,
        booking_time: formatTime(new Date()),
      },
      center: {
        "d-flex": true,
        "justify-content-center": true,
        "align-items-center": true,
      },
    };
  },
  mounted() {
    this.getTable();
  },
  methods: {
    getTable() {
      axios
        .get("http://44.206.165.83:3000/?search=" + this.$route.query.table)
        .then((response) => {
          this.table = response.data[0];
          this.getData();
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getData() {
      if (this.table.table_status == "booked") {
        const data = {
          table: this.$route.query.table,
        };
        axios
          .post("http://44.206.165.83:3000/table/bookData", data)
          .then((response) => {
            if (response) {
              this.bookData = response.data;
            }
          })
          .catch((err) => {
            console.log(err);
          });
      }
    },
    cancel() {
      const data = {
        table: this.$route.query.table,
      };
      axios
        .post("http://44.206.165.83:3000/table/cancel", data)
        .then((response) => {
          console.log(response);
          this.$router.push({ path: "/tables" });
        })
        .catch((err) => {
          console.log(err);
        });
    },
    checkin() {
      const data = {
        booking_id: this.bookData.booking_id,
        username: this.bookData.username,
        table: this.$route.query.table,
      };
      axios
        .post("http://44.206.165.83:3000/table/checkin", data)
        .then((response) => {
          console.log(response);
          this.$router.push({ path: "/tables" });
        })
        .catch((err) => {
          console.log(err);
        });
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
