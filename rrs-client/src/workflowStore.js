import Vue from 'vue'
import {getWorkflows, getWholeWorkflow} from './config'
const state = {
  currentWorkflow: null,
  workflows: {}
}

const mutations = {
  SET_CURRENT_WORKFLOW (state, obj) {
    state.currentWorkflow = obj
  },
  SET_WORKFLOWS (state, obj) {
    state.workflows = obj
  }
}

const actions = {
  setCurrentWorkflow: ({commit}, obj) => {
    return new Promise((resolve, reject) => {
      const postData = {
        workflow_id: obj
      }
      Vue.http.post(getWholeWorkflow, postData)
        .then(response => {
          window.localStorage.setItem('currentWorkflow', obj)
          commit('SET_CURRENT_WORKFLOW', response.data)
          resolve(response.status)
        })
    })
  },
  setWorkflows: ({commit}, obj) => {
    Vue.http.post(getWorkflows)
      .then(response => {
        commit('SET_WORKFLOWS', response.data)
      })
  }
}

export default {
  state, mutations, actions
}
