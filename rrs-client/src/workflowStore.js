import Vue from 'vue'
import {getWorkflows, getWholeWorkflow} from './config'
const state = {
  currentWorkflow: {},
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
    const postData = {
      workflow_id: obj
    }
    Vue.http.post(getWholeWorkflow, postData)
      .then(response => {
        commit('SET_CURRENT_WORKFLOW', response.data)
        return 'success'
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
