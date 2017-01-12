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
import EmbroideryForm from './forms/EmbroideryForm'
import ArtpackForm from './forms/ArtpackForm'
import SingleTask from './pages/SingleTask'
import LiveRequests from './components/tasks-elements/LiveRequests'
import ArtpackDisplay from './components/form-displays/ArtpackDisplay.vue'
import ChatBoard from './components/chat/chat-board/ChatBoard'
import GSignInButton from 'vue-google-signin-button'

Vue.use(GSignInButton)
Vue.use(VueRouter)
Vue.use(VueResource)

Vue.component('app', App)
Vue.component('artpackDisplay', ArtpackDisplay)
Vue.component('chatBoard', ChatBoard)

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
  {path: '/request-form/embroidery', component: EmbroideryForm, name: 'embroideryForm'},
  {path: '/request-form/artpack', component: ArtpackForm, name: 'artpackForm'},
  {path: '/tasks/single', component: SingleTask, name: 'singletask'},
  {path: '/tasks/live', component: LiveRequests, name: 'liverequests'}
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
