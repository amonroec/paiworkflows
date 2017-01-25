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
    commit('SET_CURRENT_WORKFLOW', obj)
  },
  setWorkflows: ({commit}, obj) => {
    commit('SET_WORKFLOWS', obj)
  }
}

export default {
  state, mutations, actions
}
