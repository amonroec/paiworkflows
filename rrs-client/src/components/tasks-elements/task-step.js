import {getWorkers, assignTask, submitChat, uploadFile} from './../../config'
import {mapState} from 'vuex'
var methods = {}
/*
methods.startFunction = function () {
  document.querySelector('html').classList.add('js')
  generateKinetic: function(){
      this.stage = new Kinetic.Stage({
          container: this.$els.canvas,
          width: 300,
          height: 300
      });
  }
  var fileInput = document.querySelector('.input-file')
  var button = document.querySelector('.input-file-trigger')
  var theReturn = document.querySelector('.file-return')
  button.addEventListener('keydown', function (event) {
    if (event.keyCode === 13 || event.keyCode === 32) {
      fileInput.focus()
    }
  })
  button.addEventListener('click', function (event) {
    fileInput.focus()
    return false
  })
  fileInput.addEventListener('change', function (event) {
    theReturn.innerHTML = this.value
  })
}
*/
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
    task: JSON.stringify(this.taskStore.currentTask),
    app_worker: this.selectedWorker
  }
  console.log(postData)
  this.$http.post(assignTask, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response.data)
        this.submitMessage('assign', 'Assigned')
      }
    })
}

methods.submitForApproval = function (e) {
  const postData = {
    task_id: this.taskStore.currentTask.id
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

methods.clickUpload = function () {
  var uploadButton = document.querySelector('.fileUpload')
  uploadButton.click()
  this.task = JSON.stringify(this.taskStore.currentTask)
  console.log(this.task)
}

methods.submitMessage = function (action, text) {
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
  this.message.text = text
  var date = new Date()
  var n = date.toLocaleString()
  this.message.date = n
  this.message.action = action
  this.message.user_picture = this.userStore.authUser.picture
  console.log(this.taskStore.currentTask)
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message
  }
  console.log(postData)
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        if (action === 'upload-file') {
          var submitButton = document.querySelector('#submitUpload')
          submitButton.click()
        }
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
        action: '',
        user_picture: ''
      },
      task: '',
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
