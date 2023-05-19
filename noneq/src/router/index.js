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
    path: '/order',
    name: 'Order',
    component: () => import('../views/Order.vue')
  },
]

const router = new VueRouter({
  routes
})

export default router