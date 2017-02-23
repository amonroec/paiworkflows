import {getMessages, tasksUrl, getArtpack} from './../../config'
import Vue from 'vue'
const state = {
  currentTask: '',
  tasks: null,
  currentForm: {},
  currentChat: {},
  loading: '',
  alert: '',
  stage: '',
  tasksLoading: ''
}

const mutations = {
  SET_TASKS_ARRAY (state, obj) {
    state.tasks = obj
    return
  },
  SET_CURRENT_TASK (state, obj) {
    state.currentTask = obj
  },
  SET_CURRENT_FORM (state, obj) {
    state.currentForm = obj
  },
  SET_CURRENT_CHAT (state, obj) {
    state.currentChat = obj
    state.loading = false
  },
  SET_LOADING (state, obj) {
    state.loading = obj
  },
  SET_ALERT (state, obj) {
    state.alert = obj
  },
  SET_STAGE (state, obj) {
    state.stage = obj
  },
  SET_TASKS_LOADING (state, obj) {
    state.tasksLoading = obj
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
    commit('SET_TASKS_LOADING', true)
    const postData = {
      userId: obj.user_id,
      groups: 'ASI Artpack'
    }
    Vue.http.post(tasksUrl, postData)
      .then(response => {
        if (response.status === 200) {
          commit('SET_TASKS_ARRAY', response.data)
          commit('SET_TASKS_LOADING', false)
        }
      })
  },
  setCurrentTask: ({commit}, obj) => {
    commit('SET_CURRENT_TASK', obj)
    if (obj !== '') {
      const postData = {
        task_id: obj
      }
      Vue.http.post(getArtpack, postData)
        .then(response => {
          if (response.status === 200) {
            commit('SET_CURRENT_FORM', response.data[0])
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
          }
        })
    }
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
  },
  taskLoading: ({commit}, obj) => {
    commit('SET_TASKS_LOADING', obj)
  }
}

export default {
  state, mutations, actions
}
