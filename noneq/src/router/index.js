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
]

const router = new VueRouter({
  routes
})

export default router