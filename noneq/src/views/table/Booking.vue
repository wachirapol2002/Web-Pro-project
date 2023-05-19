<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="fw-bold text-center mb-2">
                <img :src="require('@/assets/logo.png')" style="width: 80px; border-radius: 50%;"><br>
                NoneQ
            </div>
                <div class="container-fluid bg-light px-5 py-4 border border-darkborder border-dark" style="width: 40vw; border-radius: 10px;">
                <h1 class="rounded-3">จองโต๊ะ</h1>
                <br>
                <form name="signup" >
                  <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="username">เลขโต๊ะ </label>
                            <div class="mx-3">{{this.$route.query.table}} </div>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="username">ผู้จอง</label>
                            <div class="mx-3">{{username}} </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="date">วันที่</label>
                            <input class="form-control" :class="{ 'border-danger': $v.date.$error }" type="date" id="date" v-model="date">
                            <template v-if="$v.date.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.date.required">
                                    date is required
                                </p>
                            </template>
                        </div>
                        <div class="form-group col-6">
                            <label class="form-label fw-bold" for="time">เวลา</label>
                            <input class="form-control" :class="{ 'border-danger': $v.time.$error }" type="time" id="time" v-model="time">
                            <template v-if="$v.time.$error">
                                <p class="text-danger m-0 p-0" v-if="!$v.time.required">
                                    time is required
                                </p>
                            </template>
                        </div>
                    </div>
                    <p v-if="error" class="px-3 py-2 mb-3 alert alert-danger">
                          {{ error }}
                        </p>
                    
                    
                    <div class="row my-2">
                      <div class="form-group d-flex justify-content-center">
                          <div class="btn btn-dark btn-md mt-4 mx-2" @click="back()">Back</div>
                          <div class="btn btn-dark btn-md mt-4 mx-2" @click="book()">Confirm</div>
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
} from "vuelidate/lib/validators";

function formatDate(date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
}

function formatTime(date) {
  const hours = date.getHours().toString().padStart(2, "0");
  const minutes = date.getMinutes().toString().padStart(2, "0");
  return `${hours}:${minutes}`;
}

// function currentDate(value) {
//   const currentDate = formatDate(new Date());
//    return value >= currentDate;
// }

// function currentTime(value) {
//   const currentTime = formatTime(new Date());
//   const selectedTime = value;
//   console.log(currentTime)
//   console.log(selectedTime)
//   console.log(selectedTime > currentTime)
//   return selectedTime > currentTime;
// }

export default {
  name: "BookingPage",
  data() {
    return {
      previousRoutes: [],
      username: this.$cookies.get('account').username,
      table: this.$route.query.table,
      date: formatDate(new Date()),
      time: formatTime(new Date()),
      error: "",
      center:{
      'd-flex': true,
      'justify-content-center':true,
      'align-items-center':true
    },
    };
  },
  validations: {
    date: {
      required: required,
    },
    time: {
      required: required,
    },
  },
  methods: {
    book() {
      // Validate all fields
      this.$v.$touch();
      // เช็คว่าในฟอร์มไม่มี error
      if (!this.$v.$invalid) {
        const data = {
          username: this.username,
          table: this.table,
          date: this.date,
          time: this.time,
        };
        console.log(data)
        axios
          .post("http://localhost:3000/table/book", data)
          .then(() => {
            this.$router.push({path:'/tables'})
            alert("Updated");
          })
          .catch(error => {
            console.log(error)
            this.error = error.response.data.details[0].message
            // if(error.response.data.details[0].message != undefined){
            //   this.error = error.response.data.details[0].message
            // }else{
            //   this.error = error.response.data.message
            // }
          })
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
