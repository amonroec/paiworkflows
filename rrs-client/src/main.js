import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

import App from './App'

import LoginPage from './pages/LoginPage'
import DashboardPage from './pages/DashboardPage'
import ProfilePage from './pages/ProfilePage'
import TasksPage from './pages/TasksPage'
import CalendarPage from './pages/CalendarPage'
import GroupPage from './pages/GroupPage'
import WorkflowPage from './pages/WorkflowPage'
import SettingsPage from './pages/SettingsPage'
import MessagesPage from './pages/MessagesPage'
import RequestUser from './pages/RequestUser'
import RequestForm from './pages/RequestForm'

Vue.use(VueRouter)
Vue.use(VueResource)

Vue.component('app', App)

/* eslint-disable no-new */

const routes = [
  {path: '/', component: LoginPage, name: 'home'},
  {path: '/dashboard', component: DashboardPage, name: 'dashboard', meta: { requiresAuth: true }},
  {path: '/profile', component: ProfilePage, name: 'profile', meta: { requiresAuth: true }},
  {path: '/tasks', component: TasksPage, name: 'tasks', meta: { requiresAuth: true }},
  {path: '/calendar', component: CalendarPage, name: 'calendar', meta: { requiresAuth: true }},
  {path: '/group', component: GroupPage, name: 'group', meta: { requiresAuth: true }},
  {path: '/workflow', component: WorkflowPage, name: 'workflow', meta: { requiresAuth: true }},
  {path: '/settings', component: SettingsPage, name: 'settings', meta: { requiresAuth: true }},
  {path: '/messages', component: MessagesPage, name: 'messages', meta: { requiresAuth: true }},
  {path: '/request-user', component: RequestUser, name: 'request-user'},
  {path: '/request-form', component: RequestForm, name: 'request-form'}
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
