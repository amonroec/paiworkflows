import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

import App from './App'

import LoginPage from './pages/LoginPage'
import DashboardPage from './pages/DashboardPage'

Vue.use(VueRouter)
Vue.use(VueResource)

Vue.component('app', App)

/* eslint-disable no-new */

const routes = [
  {path: '/', component: LoginPage, name: 'home'},
  {path: '/dashboard', component: DashboardPage, name: 'dashboard', meta: { requiresAuth: true }}
]

const router = new VueRouter({
  mode: 'history',
  routes
})

router.beforeEach((to, from, next) => {
  console.log(to)
  if (to.meta.requiresAuth) {
    const authUser = JSON.parse(window.localStorage.getItem('authUser'))
    if (authUser && authUser.access_token) {
      next()
    } else {
      next({name: 'home'})
    }
  }
  next()
})

new Vue({
  router
}).$mount('#app')
