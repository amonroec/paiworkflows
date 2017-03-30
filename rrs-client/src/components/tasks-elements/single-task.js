import {mapState} from 'vuex'
import {readNotification} from './../../config'
var methods = {}
/*
methods.taskClicked = function (taskId) {
  this.$store.dispatch('isLoading', true)
  window.localStorage.setItem('currentTask', taskId)
  this.setCurrentTask(taskId)
}
*/
methods.startLoading = function (task) {
  var that = this
  this.$store.dispatch('taskLoading', true).then(function () {
    that.$emit('taskLoading', task)
  })
}

methods.setCurrentTask = function (task) {
  var that = this
  this.$store.dispatch('setCurrentTask', task).then(response => {
    if (response === 200) {
      that.setCurrentWorkflow(task)
      that.markAsRead()
    }
  })
}

methods.setCurrentWorkflow = function (task) {
  var that = this
  this.workflowStore.workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(task.workflow_id)) {
      that.$store.dispatch('setCurrentWorkflow', workflow.id).then(response => {
        if (response === 200) {
          that.$emit('workflowSet', workflow)
        } else {
          that.$emit('error')
        }
      })
    } else {
    }
  })
}

methods.incomingChat = function (chatMessage) {
  const data = {
    message: chatMessage.messages,
    taskId: this.actualTask.id
  }
  console.log('adding message')
  // this.$store.dispatch('setCurrentChat', chatMessage.messages)
  this.$store.dispatch('addMessage', data)
  this.actualTask.messages.push(chatMessage.messages)
  this.notificationShow = 1
  var oldTitle = document.title
  var msg = 'Task Changed!'
  var timeoutId
  var blink = function () { document.title = document.title === msg ? ' ' : msg }
  var clear = function () {
    clearInterval(timeoutId)
    document.title = oldTitle
    window.onmousemove = null
    timeoutId = null
  }
  if (!timeoutId) {
    timeoutId = setInterval(blink, 1000)
    window.onmousemove = clear
  }
}

methods.markAsRead = function () {
  var that = this
  if (this.notification) {
    const postData = {
      id: this.notification.id,
      userId: this.userStore.authUser.id,
      taskId: this.taskStore.currentTask.id
    }
    that.$http.post(readNotification, postData)
      .then(response => {
        if (response.status === 200) {
          this.notificationShow = 0
        }
      })
  } else {
    this.notificationShow = 0
  }
}

methods.setStage = function (workflow) {
  var currentStep = this.taskStore.currentTask.status
  var i = 0
  var that = this
  this.workflowStore.currentWorkflow.forEach(function (step) {
    if (step.task_type === currentStep) {
      that.$store.dispatch('setStage', i).then(response => {
        if (response === 'stage_set') {
          that.$store.dispatch('taskLoading', false)
        }
      })
    }
    i++
  })
}

module.exports = {
  data: function () {
    return {
      userId: '',
      notificationShow: '',
      actualTask: '',
      date: '',
      statusUrl: ''
    }
  },
  methods: methods,
  props: [
    'task',
    'notification',
    'groupCheck',
    'pusher'
  ],
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore,
      userStore: state => state.userStore
    })
  },
  created: function () {
    this.actualTask = this.task
    this.statusUrl = '/static/img/review.png'
    var that = this
    this.$on('taskLoading', function (taskId) {
      that.setCurrentTask(taskId)
    })
    this.$on('workflowSet', function (workflow) {
      that.markAsRead()
      that.setStage(workflow)
    })
    if (this.notification) {
      this.notificationShow = 1
    } else {
      this.notificationShow = 0
    }
    this.userChannel = this.pusher.subscribe('' + this.task.id)
    this.userChannel.bind('task_appointed', function (data) {
      console.log('task has changed')
      that.$emit('task_changed', data)
    })
    this.$on('task_changed', function (data) {
      if (parseInt(that.taskStore.currentTask.id) === parseInt(that.actualTask.id)) {
        // that.$emit('currentTaskChanged', data.newTask.task)
        that.$store.dispatch('setNewCurrentTask', data.newTask.task).then(response => {
          that.actualTask = data.newTask.task
          that.notificationShow = 1
          that.$store.dispatch('taskLoading', false)
        })
      /* if (parseInt(data.notify_person) === parseInt(that.userStore.authUser.id)) {
        that.notificationShow = 1
      } */
        var oldTitle = document.title
        var msg = 'Task Changed!'
        var timeoutId
        var blink = function () { document.title = document.title === msg ? ' ' : msg }
        var clear = function () {
          clearInterval(timeoutId)
          document.title = oldTitle
          window.onmousemove = null
          timeoutId = null
        }
        if (!timeoutId) {
          timeoutId = setInterval(blink, 1000)
          window.onmousemove = clear
        }
      }
    })
    this.userChannel.bind('chat_entered', function (data) {
      console.log('incominggggg')
      that.$emit('incoming_chat', data)
    })
    this.$on('incoming_chat', function (chatMessage) {
      that.incomingChat(chatMessage)
    })
    var date = this.actualTask.created_at.slice(0, -8)
    var yyyy = date.substr(0, 4)
    var mm = date.substr(5, 2)
    var dd = date.substr(8, 2)
    this.date = dd + '/' + mm + '/' + yyyy
  }
}
