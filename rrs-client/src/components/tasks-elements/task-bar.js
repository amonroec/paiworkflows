import {mapState} from 'vuex'
import {getArtpack, getMessages} from './../../config'
var methods = {}

methods.setCurrentTask = function (task) {
  this.$store.dispatch('setCurrentTask', task)
  this.getArtpack()
}

methods.getArtpack = function () {
  const postData = {
    task_id: this.taskStore.currentTask.id
  }
  this.$http.post(getArtpack, postData)
    .then(response => {
      if (response.status === 200) {
        this.$store.dispatch('setCurrentForm', response.data[0])
        this.getChat()
      }
    })
}

methods.getChat = function () {
  const postData = {
    task_id: this.taskStore.currentTask.id
  }
  console.log(postData)
  this.$http.post(getMessages, postData)
    .then(response => {
      this.$store.dispatch('setCurrentChat', response.data[0].messages)
      console.log(response.data[0].messages)
    })
}

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      taskStore: state => state.taskStore
    })
  }
}
