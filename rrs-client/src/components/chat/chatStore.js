import Vue from 'vue'
import {getMessages} from './../../config.js'

const state = {
  messageList: {}
}

const mutations = {
  SET_CHAT_MESSAGES (state, messageList) {
    state.messageList = messageList
  }
}

const actions = {
  setChatMessages: ({commit}, messageList) => {
    var id = 10
    const postData = {
      task_id: id
    }
    return Vue.http.post(getMessages, postData)
      .then(response => {
        if (response.status === 200) {
          commit('SET_CHAT_MESSAGES', response.body.data)
          return response.body.data
        }
      })
  }
}

export default {
  state, mutations, actions
}
