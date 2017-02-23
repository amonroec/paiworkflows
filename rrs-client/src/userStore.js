import {getGroups} from './config'
import Vue from 'vue'
const state = {
  authUser: null,
  groups: null
}

const mutations = {
  SET_AUTH_USER (state, userObj) {
    state.authUser = userObj
    return
  },
  SET_GROUPS (state, obj) {
    state.groups = obj
    console.log(state.groups)
  }
}

const actions = {
  setUserObject: ({commit}, userObj) => {
    const postData = {
      id: userObj.id
    }
    commit('SET_AUTH_USER', userObj)
    Vue.http.post(getGroups, postData)
      .then(response => {
        console.log(response)
        commit('SET_GROUPS', response.data)
      })
  }
}

export default {
  state, mutations, actions
}
