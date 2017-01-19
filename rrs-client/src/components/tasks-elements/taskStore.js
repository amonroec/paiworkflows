const state = {
  currentTask: null,
  tasks: null
}

const mutations = {
  SET_TASKS_ARRAY (state, obj) {
    state.tasks = obj
  },
  SET_CURRENT_TASK (state, obj) {
    state.currentTask = obj
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
    commit('SET_TASKS_ARRAY', obj)
  },
  setCurrentTask: ({commit}, obj) => {
    commit('SET_CURRENT_TASK', obj)
  }
}

export default {
  state, mutations, actions
}
