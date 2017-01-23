const state = {
  currentWorkflow: {}
}

const mutations = {
  SET_CURRENT_WORKFLOW (state, obj) {
    state.currentWorkflow = obj
  }
}

const actions = {
  setCurrentWorkflow: ({commit}, obj) => {
    commit('SET_CURRENT_WORKFLOW', obj)
  }
}

export default {
  state, mutations, actions
}
