import {getMessages, getHeader, tasksUrl, getArtpack} from './../../config'
import Vue from 'vue'
const state = {
  currentTask: '',
  tasks: null,
  currentForm: {},
  currentChat: {},
  loading: '',
  alert: '',
  stage: ''
}

const mutations = {
  SET_TASKS_ARRAY (state, obj) {
    state.tasks = obj
  },
  SET_CURRENT_TASK (state, obj) {
    state.currentTask = obj
  },
  SET_CURRENT_FORM (state, obj) {
    state.currentForm = obj
  },
  SET_CURRENT_CHAT (state, obj) {
    state.currentChat = obj
  },
  SET_LOADING (state, obj) {
    state.loading = obj
  },
  SET_ALERT (state, obj) {
    state.alert = obj
  },
  SET_STAGE (state, obj) {
    state.stage = obj
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
    const postData = {
      userId: obj
    }
    console.log(postData)
    Vue.http.post(tasksUrl, {headers: getHeader(), postData})
      .then(response => {
        if (response.status === 200) {
          commit('SET_TASKS_ARRAY', response.data)
        }
      })
  },
  setCurrentTask: ({commit}, obj) => {
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
      })
  },
  setCurrentForm: ({commit}, obj) => {
    const postData = {
      task_id: obj
    }
    Vue.http.post(getArtpack, postData)
      .then(response => {
        if (response.status === 200) {
          commit('SET_CURRENT_FORM', response.data[0])
        }
      })
  },
  setCurrentChat: ({commit}, obj) => {
    commit('SET_CURRENT_CHAT', obj)
  },
  isLoading: ({commit}, obj) => {
    console.log(obj)
    commit('SET_LOADING', obj)
  },
  setAlert: ({commit}, obj) => {
    var object = obj
    commit('SET_ALERT', object)
    setTimeout(function () {
      commit('SET_ALERT', '')
      commit('SET_CURRENT_TASK', '')
    }, 3000)
  },
  setStage: ({commit}, obj) => {
    commit('SET_STAGE', obj)
  }
}

export default {
  state, mutations, actions
}
