import {getGroups} from './config'
import Vue from 'vue'
const state = {
  authUser: null,
  groups: []
}

const mutations = {
  SET_AUTH_USER (state, userObj) {
    state.authUser = userObj
  },
  SET_GROUPS (state, obj) {
    state.groups = obj
  }
}

const actions = {
  setUserObject: ({commit}, userObj) => {
    return new Promise((resolve, reject) => {
      const postData = {
        id: userObj.id
      }
      commit('SET_AUTH_USER', userObj)
      Vue.http.post(getGroups, postData)
        .then(response => {
          commit('SET_GROUPS', response.data)
          console.log(response.data)
          resolve('user_set')
        })
    })
  },
  logout: ({commit}, userObj) => {
    commit('SET_AUTH_USER', null)
  }
}

export default {
  state, mutations, actions
}
