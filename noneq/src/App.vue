<template>
  <div id="app">
    <!-- nav bar -->
    <nav class="navbar navbar-light sticky-top border-bottom bg-dark" style="height: 10vh;">
            <div class="container-fluid">

                  <div class="d-flex">
                    <!-- logo -->
                    <router-link to="/">
                      <div :class="center" style="border: 3px solid gray; border-radius: 50%;">
                          <img :src="require('./assets/logo.png')" style="max-height:7.5vh; width: auto; border-radius: 50%;">
                      </div>
                    </router-link>
                    <template v-if="this.$cookies.isKey('account') && this.$cookies.get('account').permission=='staff'">
                        <router-link to="/booking" :class="center" style="text-decoration: none;">
                          <div class="text-light ml-3 px-2" :class="[center, { 'bg-secondary': hoverBooking }]" @mouseover="hoverBooking = true" @mouseleave="hoverBooking = false"  style="border: 3px solid white; border-radius: 10px;">
                              Booking
                          </div>
                        </router-link>
                        <router-link to="/checkin" :class="center" style="text-decoration: none;">
                          <div class="text-light ml-3 px-2" :class="[center, { 'bg-secondary': hoverCheckIN }]" @mouseover="hoverCheckIN = true" @mouseleave="hoverCheckIN = false"  style="border: 3px solid white; border-radius: 10px;">
                              CheckIN
                          </div>
                        </router-link>
                        <router-link to="/payments" :class="center" style="text-decoration: none;">
                          <div class="text-light ml-3 px-2" :class="[center, { 'bg-secondary': hoverPayment }]" @mouseover="hoverPayment = true" @mouseleave="hoverPayment = false"  style="border: 3px solid white; border-radius: 10px;">
                              Payment
                          </div>
                        </router-link>
                        <router-link to="/VIP" :class="center" style="text-decoration: none;">
                          <div class="text-light ml-3 px-2" :class="[center, { 'bg-secondary': hoverVIP }]" @mouseover="hoverVIP = true" @mouseleave="hoverVIP = false"  style="border: 3px solid white; border-radius: 10px;">
                              VIP member
                          </div>
                        </router-link>
                    </template>
                  </div>
                    <template v-if="this.$cookies.isKey('account')">
                        <div :class="center" >
                            <router-link to="/user/profile" class="d-flex" :class="center" style="text-decoration: none;">
                              <div class="bi bi-person text-light mx-3" style="font-size: 2rem;"></div>
                              <div class=' fw-bold fs-8 mx-1 text-white' :class="center">{{this.$cookies.get('account').username}}</div>
                            </router-link>
                            <button type="button" class="btn btn-danger btn-sm mx-2" @click.stop="logout()">Logout</button>
                        </div>
                    </template>
                    <template v-else>
                      <router-link to="/user/login" style="text-decoration: none;">
                        <div :class="center">
                            <div class="bi bi-person text-light mx-3" style="font-size: 2rem;"></div>
                            <div class=' fw-bold fs-8 mx-1 text-white' :class="center">เข้าสู่ระบบ/ลงทะเบียน</div>
                        </div>
                      </router-link>
                    </template>
            </div>
    </nav>
    
    <router-view :key="$route.fullPath" />
  </div>
</template>


<script>
export default {
  data() {
    return {
      shopName: "NoneQ Stores",
      open: true,
      center:{
          'd-flex': true,
          'justify-content-center':true,
          'align-items-center':true
      },
      hoverBooking: false,
      hoverCheckIN: false,
      hoverPayment: false,
      hoverVIP: false,
    };
  },
  methods: {
    logout () {
      this.$cookies.keys().forEach(cookie => this.$cookies.remove(cookie))
      alert("Logout");
      this.$router.push({path: '/user/login'})
    },
  },
};

        
</script>