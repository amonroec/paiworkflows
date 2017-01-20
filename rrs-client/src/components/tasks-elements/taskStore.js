const state = {
  currentTask: null,
  tasks: null,
  currentForm: {},
  currentChat: {}
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
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
    commit('SET_TASKS_ARRAY', obj)
  },
  setCurrentTask: ({commit}, obj) => {
    commit('SET_CURRENT_TASK', obj)
  },
  setCurrentForm: ({commit}, obj) => {
    commit('SET_CURRENT_FORM', obj)
  },
  setCurrentChat: ({commit}, obj) => {
    commit('SET_CURRENT_CHAT', obj)
  }
}

export default {
  state, mutations, actions
}
