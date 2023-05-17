<template>
  <div id="app">
    <!-- nav bar -->
    <nav class="navbar navbar-light sticky-top border-bottom bg-dark" style="height: 10vh;">
            <div class="container-fluid">
                  <!-- logo -->
                    <div :class="center">
                        <img :src="require('./assets/logo.png')" style="max-height:7.5vh; width: auto; border-radius: 50%;">
                    </div>
                    <div class="d-flex" :class="center" >
                        <a class="bi bi-person text-light mx-3" style="font-size: 2rem;"></a>
                        <router-link to="/user/login">
                        <div class=' fw-bold fs-8 mx-1 text-white' :class="center">เข้าสู่ระบบ/ลงทะเบียน</div>
                        </router-link>
                    </div>
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

};

        
</script>