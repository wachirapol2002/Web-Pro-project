<template>
  <div id="app">
    <!-- nav bar -->
    <nav class="navbar navbar-light sticky-top border-bottom bg-dark" style="height: 10vh;">
            <div class="container-fluid">

                  <div class="d-flex">
                    <!-- logo -->
                    <router-link to="/">
                      <div :class="center" style="border: 1px solid white; border-radius: 5%;">
                          <img :src="require('./assets/logo.png')" style="max-height:7.5vh; width: auto; border-radius: 50%;">
                      </div>
                    </router-link>
                    <div class="d-flex"  style="border: 1px solid white; border-radius: 5%;">
                          <img :src="require('./assets/logo.png')" style="max-height:7.5vh; width: auto; border-radius: 50%;">
                    </div>
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
    };
  },
  methods: {
    logout () {
      this.$cookies.keys().forEach(cookie => this.$cookies.remove(cookie))
      alert("Logout");
      this.$router.push({path: '/user/login'})
    }
  },

};

        
</script>