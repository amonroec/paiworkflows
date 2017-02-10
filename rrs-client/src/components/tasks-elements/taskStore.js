import {getMessages} from './../../config'
import Vue from 'vue'
const state = {
  currentTask: '',
  tasks: null,
  currentForm: {},
  currentChat: {},
  loading: ''
}

const mutations = {
  SET_TASKS_ARRAY (state, obj) {
    state.tasks = obj
  },
  SET_CURRENT_TASK (state, obj) {
    state.currentTask = obj
    console.log(state.currentTask)
  },
  SET_CURRENT_FORM (state, obj) {
    state.currentForm = obj
  },
  SET_CURRENT_CHAT (state, obj) {
    state.currentChat = obj
  },
  SET_LOADING (state, obj) {
    state.loading = obj
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
    commit('SET_TASKS_ARRAY', obj)
  },
  setCurrentTask: ({commit}, obj) => {
    commit('SET_LOADING', true)
    commit('SET_CURRENT_TASK', obj)
    const postData = {
      task_id: obj.id
    }
    Vue.http.post(getMessages, postData)
      .then(response => {
        if (response.data.length === 0) {
          var array = []
          var mes = {
            name: '',
            text: 'No Messages',
            date: '',
            action: ''
          }
          array.push(mes)
          commit('SET_CURRENT_CHAT', array)
        } else {
          commit('SET_CURRENT_CHAT', response.data[0].messages)
        }
        commit('SET_LOADING', false)
      })
  },
  setCurrentForm: ({commit}, obj) => {
    commit('SET_CURRENT_FORM', obj)
  },
  setCurrentChat: ({commit}, obj) => {
    commit('SET_CURRENT_CHAT', obj)
  },
  startLoading: ({commit}, obj) => {
    commit('SET_LOADING', obj)
  }
}

export default {
  state, mutations, actions
}
