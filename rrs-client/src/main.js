import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import Vuex from 'vuex'
import store from './store'

import App from './App'

import LoginPage from './pages/LoginPage'
import DashboardPage from './pages/DashboardPage'
import ProfilePage from './pages/ProfilePage'
import CalendarPage from './pages/CalendarPage'
import WorkflowPage from './pages/WorkflowPage'
import RequestUser from './pages/RequestUser'
import ChatBoard from './components/chat/chat-board/ChatBoard'
import GSignInButton from 'vue-google-signin-button'
import Home from './pages/Home'
import SearchPage from './pages/SearchPage'
import SuccessfulSubmit from './pages/SuccessfulSubmit'

Vue.use(GSignInButton)
Vue.use(VueRouter)
Vue.use(VueResource)
Vue.use(Vuex)

Vue.component('app', App)
Vue.component('chatBoard', ChatBoard)
/* eslint-disable no-new */

const routes = [
  {path: '/', component: LoginPage, name: 'login'},
  {path: '/dashboard', component: DashboardPage, name: 'dashboard'},
  {path: '/profile', component: ProfilePage, name: 'profile'},
  {path: '/calendar', component: CalendarPage, name: 'calendar'},
  {path: '/workflow', component: WorkflowPage, name: 'workflow'},
  {path: '/request-user', component: RequestUser, name: 'request-user'},
  {path: '/home', component: Home, name: 'home', auth: true},
  {path: '/search', component: SearchPage, name: 'searchpage'},
  {path: '/form/success', component: SuccessfulSubmit, name: 'successfulsubmit'}
]

const router = new VueRouter({
  mode: 'history',
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    const authUser = JSON.parse(window.localStorage.getItem('authUser'))
    if (authUser && authUser.access_token) {
      next()
    } else {
      next({name: 'login'})
    }
  }
  next()
})

new Vue({
  router, store
}).$mount('#app')
