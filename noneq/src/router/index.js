import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: () => import('../views/Home.vue')
  },
  {
    path: '/user/login',
    name: 'Login',
    component: () => import('../views/user/Login.vue')
  },
  {
    path: '/user/signup',
    name: 'Signup',
    component: () => import('../views/user/Signup.vue')
  },
  {
    path: '/user/profile',
    name: 'Profile',
    component: () => import('../views/user/Profile.vue')
  },
  {
    path: '/user/profile-edit',
    name: 'Profile-edit',
    component: () => import('../views/user/Profile-edit.vue')
  },
  {
    path: '/user/change-password',
    name: 'PasswordChange',
    component: () => import('../views/user/Password-change.vue')
  },
  {
    path: '/tables',
    name: 'Tables',
    component: () => import('../views/table/Tables.vue')
  },
  {
    path: '/tables/booking',
    name: 'Booking',
    component: () => import('../views/table/Booking.vue')
  },
  {
    path: '/tables/checkin',
    name: 'CheckIN',
    component: () => import('../views/table/CheckIN.vue')
  },
  {
    path: '/order',
    name: 'Order',
    component: () => import('../views/Order.vue')
  },
  {
    path: '/confirm',
    name: 'Comfirm',
    component: () => import('../views/Confirm.vue')
  },
  {
    path: '/booking',
    name: 'BookingTable',
    component: () => import('../views/dataTable/BookingTable.vue')
  },
  {
    path: '/checkin',
    name: 'CheckINTable',
    component: () => import('../views/dataTable/CheckINTable.vue')
  },
  {
    path: '/payments',
    name: 'PaymentTable',
    component: () => import('../views/dataTable/PaymentTable.vue')
  },
  {
    path: '/VIP',
    name: 'VIPTable',
    component: () => import('../views/dataTable/VIPTable.vue')
  },
  {
    path: '/register',
    name: 'RegisterTable',
    component: () => import('../views/dataTable/RegisterTable.vue')
  },
  {
    path: '/registerVIP',
    name: 'RegisterVIP',
    component: () => import('../views/registerVIP.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router