import {submitChat} from './../../../config.js'
import {mapState} from 'vuex'

var methods = {}

methods.getNameId = function () {
  /*
  this.message.name = window.sessionStorage.getItem('userName')
  this.message.id = window.sessionStorage.getItem('userId')
  */
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
  this.message.user_picture = this.userStore.authUser.picture
}

methods.submitChat = function () {
  this.loading = true
/*
  Pusher.logToConsole = true
  this.pusher = new Pusher('9ca3eda463882645ca10', {
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
*/
  if (parseInt(this.taskStore.currentTask.app_artist) === parseInt(this.userStore.authUser.id)) {
    this.receiver = this.taskStore.currentTask.csr_assigned
  } else {
    if (this.taskStore.currentTask.status === 'assign_group') {
      this.receiver = this.taskStore.currentTask.csr_assigned
    } else {
      this.receiver = this.taskStore.currentTask.app_artist
    }
  }
  console.log(this.receiver)
  var date = new Date()
  var n = date.toLocaleString()
  this.message.date = n
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message,
    receiver: parseInt(this.receiver)
  }
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response)
        this.message.text = ''
        this.loading = false
      }
    })
}

methods.getDate = function () {
  var date = new Date()
  var n = date.toLocaleString()
  this.message.date = n
}

methods.setTaskId = function () {
}

module.exports = {
  data: function () {
    return {
      message: {
        name: '',
        id: '',
        user_picture: '',
        text: '',
        date: '',
        action: 'message'
      },
      receiver: '',
      taskId: '',
      pusher: '',
      loading: false
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
