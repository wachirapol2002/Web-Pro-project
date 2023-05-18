import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Vuelidate from 'vuelidate'
import VueCookies from 'vue-cookies'
import 'bulma/css/bulma.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-icons/font/bootstrap-icons.css'

Vue.config.productionTip = false

Vue.use(Vuelidate)

Vue.use(VueCookies, {
  expireTimes: 60 * 60 // กำหนดเวลาหมดอายุให้เป็น 1 ชั่วโมง (60 นาที * 60 วินาที)
})

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

