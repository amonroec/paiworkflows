import {getWorkers, assignTask, submitChat, uploadFile} from './../../config'
import {mapState} from 'vuex'
var methods = {}

methods.getWorkers = function () {
  const postData = {
    division: 3,
    accessLevel: 3
  }
  this.$http.post(getWorkers, postData)
    .then(response => {
      if (response.status === 200) {
        this.workers = response.data
        console.log(response.data)
      } else {
        console.log('falieddddd')
      }
    })
}

methods.assignTask = function () {
  const postData = {
    id: this.request_id,
    worker_id: this.selectedWorker
  }
  console.log(postData)
  this.$http.post(assignTask, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response)
      }
    })
}

methods.submitForApproval = function (e) {
  /*
  const postData = {
    task: this.taskStore.currentTask
  }
  this.$http.post(submitApproval, postData)
    .then(response => {
      console.log(response)
    })
  */
  var file = e.target[1].value
  const postData = {
    task: this.taskStore.currentTask,
    file: file
  }
  this.$http.post(uploadFile, postData)
    .then(response => {
      console.log(response)
    })
}

methods.approveArt = function () {
  console.log('approve')
  this.submitMessage('approve-art')
}

methods.submitDecline = function () {
  this.submitMessage('decline-art')
}

methods.submitMessage = function (action) {
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
  this.message.date = Date()
  this.message.action = action
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message
  }
  console.log(postData)
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response.data)
      }
    })
}

module.exports = {
  name: 'assignTask',
  data: function () {
    return {
      workers: [],
      selectedWorker: 'assignWorker',
      id: '',
      declineArtValue: 0,
      message: {
        name: '',
        id: '',
        text: '',
        date: '',
        action: ''
      },
      fileUpload: ''
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore,
      userStore: state => state.userStore
    })
  },
  created: function () {
    this.getWorkers()
  }
}
