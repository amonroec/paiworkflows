import {getWorkers, assignTask, submitChat, submitForApproval, submitReview, claimTask} from './../../config'
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
  this.loading = true
  const postData = {
    division: 3,
    accessLevel: 3
  }
  this.$http.post(getWorkers, postData)
    .then(response => {
      if (response.status === 200) {
        this.workers = response.data
      }
    })
}

methods.assignTask = function () {
  this.loading = true
  const postData = {
    task: this.taskStore.currentTask,
    app_worker: this.selectedWorker
  }
  this.$http.post(assignTask, postData)
    .then(response => {
      if (response.status === 200) {
        this.submitMessage('assign', 'This task has been assigned')
      }
      console.log(response)
    })
}

methods.submitForApproval = function (el) {
  this.loading = true
  const postData = {
    task: this.taskStore.currentTask
  }
  this.$http.post(submitForApproval, postData)
    .then(response => {
      if (response.data === 'success') {
        this.submitMessage('submit-for-approval', 'Submitted for Approval')
      }
    })
}

methods.approveArt = function () {
  this.submitMessage('approve-art')
}

methods.submitReview = function (action) {
  this.loading = true
  const postData = {
    task: this.taskStore.currentTask,
    action: action
  }
  this.$http.post(submitReview, postData)
    .then(response => {
      if (response.status === 200) {
        if (action === 'approve-art') {
          this.submitMessage(action, 'File has been approved!')
        } else {
          this.submitMessage(action, this.declineText)
        }
      }
      console.log(response)
    })
}

methods.claimTask = function () {
  this.loading = true
  const postData = {
    task: this.taskStore.currentTask,
    user_id: this.userStore.authUser.id
  }
  this.$http.post(claimTask, postData)
    .then(response => {
      if (response.status === 200) {
        this.submitMessage('claim-task', 'This task has been claimed')
      }
      console.log(response)
    })
}

methods.clickUpload = function () {
  var uploadButton = document.querySelector('.fileUpload')
  uploadButton.click()
  this.task = JSON.stringify(this.taskStore.currentTask)
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
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message
  }
  console.log(postData)
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        if (action === 'upload-file') {
          var submitButton = document.querySelector('#submitUploadForm')
          console.log(submitButton)
          submitButton.click()
        } else {
          this.$store.dispatch('setAlert', action)
          const post = {
            user_id: this.userStore.authUser.id,
            user_groups: this.userStore.groups
          }
          this.$store.dispatch('setTasksArray', post)
          this.$store.dispatch('setCurrentTask', '')
          this.loading = false
        }
      }
    })
}

methods.fileInputLoaded = function () {
  document.querySelector('#uploadButton').disabled = false
  document.querySelector('#uploadButton').style.color = 'white'
  document.querySelector('#uploadButton').style.backgroundColor = 'green'
  console.log(document.querySelector('#submitUploadForm'))
}

module.exports = {
  name: 'assignTask',
  data: function () {
    return {
      workers: [],
      selectedWorker: 'assignWorker',
      id: '',
      declineArtValue: 0,
      declineText: '',
      message: {
        name: '',
        id: '',
        text: '',
        date: '',
        action: '',
        user_picture: ''
      },
      task: '',
      fileUpload: '',
      fileUploaded: false,
      loading: ''
    }
  },
  methods: methods,
  watch: {
    'workers': function () {
      this.loading = false
    }
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore,
      userStore: state => state.userStore,
      alert: state => state.taskStore.alert
    })
  },
  created: function () {
    this.getWorkers()
  }
}
