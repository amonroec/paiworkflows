import {submitChat} from './../../../config.js'
import {mapState} from 'vuex'
import Pusher from 'pusher-js'

var methods = {}

methods.getNameId = function () {
  /*
  this.message.name = window.sessionStorage.getItem('userName')
  this.message.id = window.sessionStorage.getItem('userId')
  */
  console.log(this.userStore.authUser.name)
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
}

methods.incomingChat = function (chatMessage) {
  console.log(chatMessage)
}

methods.submitChat = function () {
  Pusher.logToConsole = true
  this.pusher = new Pusher('4be3f9e30b1c0f0ecea4', {
    encrypted: true,
    cluster: 'mt1'
  })
  var that = this
  this.channel = this.pusher.subscribe('chat_channel')
  this.channel.bind('chat_entered', function (data) {
    that.$emit('incoming_chat', data)
  })
  this.$on('incoming_chat', function (chatMessage) {
    this.incomingChat(chatMessage)
    console.log('incoming chat boyssss')
  })
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message
  }
  console.log(postData)
  this.getDate()
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        this.message.text = ''
        console.log(response.data)
      }
    })
}

methods.getDate = function () {
  this.message.date = Date()
}

methods.setTaskId = function () {
}

module.exports = {
  data: function () {
    return {
      message: {
        name: '',
        id: '',
        text: '',
        date: ''
      },
      taskId: '',
      pusher: '',
      channel: ''
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      userStore: state => state.userStore,
      taskStore: state => state.taskStore
    })
  },
  created: function () {
    this.getNameId()
    this.getDate()
  }
}
