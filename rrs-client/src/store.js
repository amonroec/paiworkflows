import Vue from 'vue'
import Vuex from 'vuex'

import chatStore from './components/chat/chatStore'
import userStore from './userStore'
import workflowStore from './workflowStore'
import taskStore from './components/tasks-elements/taskStore'

Vue.use(Vuex)
const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    chatStore,
    userStore,
    workflowStore,
    taskStore
  },
  strict: debug
})
