import {getWorkers, assignTask, submitForApproval, claimTask, apiDomain, submitReview} from './../../config'
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
  this.$store.dispatch('taskLoading', true)
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
  this.$store.dispatch('taskLoading', true)
  var mess = this.submitMessage('assign', 'This task has been assigned')
  const postData = {
    task: this.taskStore.currentTask,
    app_worker: this.selectedWorker,
    message: mess
  }
  this.$http.post(assignTask, postData)
    .then(response => {
      if (response.status === 200) {
        /* this.submitMessage('assign', 'This task has been assigned') */
      }
    })
}

methods.submitForApproval = function () {
  this.$store.dispatch('taskLoading', true)
  var mess = this.submitMessage('submit-for-approval', 'Submitted for Approval')
  const postData = {
    task: this.taskStore.currentTask,
    message: mess
  }
  this.$http.post(submitForApproval, postData)
    .then(response => {
      console.log(response)
    })
}

methods.approveArt = function () {
  this.submitMessage('approve-art')
}

methods.submitReview = function (action) {
  this.$store.dispatch('taskLoading', true)
  var mess
  if (action === 'approve-art') {
    mess = this.submitMessage(action, 'Art has been approved')
  } else {
    mess = this.submitMessage(action, this.declineText)
  }
  console.log(mess)
  const postData = {
    task: this.taskStore.currentTask,
    action: action,
    message: mess
  }
  this.$http.post(submitReview, postData)
    .then(response => {
      console.log(response)
      if (response.status === 200) {
        this.$store.dispatch('setAlert', 'This task has been claimed')
      }
    })
}

methods.uploadFile = function () {
  var submitButton = document.querySelector('#submitUploadForm')
  submitButton.click()
  this.$store.dispatch('taskLoading', true)
}

methods.claimTask = function () {
  this.$store.dispatch('taskLoading', true)
  var mess = this.submitMessage('claim-task', 'This task has been claimed')
  const postData = {
    task: this.taskStore.currentTask,
    user_id: this.userStore.authUser.id,
    message: mess
  }
  this.$http.post(claimTask, postData)
    .then(response => {
      if (response.status === 200) {
        this.$store.dispatch('setAlert', 'This task has been claimed')
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
  if (parseInt(this.taskStore.currentTask.app_artist) === parseInt(this.userStore.authUser.id)) {
    this.receiver = this.taskStore.currentTask.csr_assigned
  } else {
    if (this.taskStore.currentTask.status === 'assign_group') {
      this.receiver = this.taskStore.currentTask.csr_assigned
    } else {
      this.receiver = this.taskStore.currentTask.app_artist
    }
  }
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
  this.message.text = text
  var date = new Date()
  var n = date.toLocaleString()
  this.message.date = n
  this.message.action = action
  this.message.user_picture = this.userStore.authUser.picture
  var array = []
  /* this.taskStore.currentTask.messages.forEach(function (mess) {
    array.push(mess)
  }) */
  var finalArray = []
  var otherArray = this.taskStore.currentTask.messages
  if (otherArray === null) {
    finalArray.push(this.message)
  } else {
    array.push(this.message)
    finalArray = otherArray.concat(array)
  }
  return finalArray
  /*
  const postData = {
    task_id: this.taskStore.currentTask.id,
    message: this.message,
    receiver: this.receiver
  }
  this.$http.post(submitChat, postData)
    .then(response => {
      if (response.status === 200) {
        if (action === 'upload-file') {
          var submitButton = document.querySelector('#submitUploadForm')
          submitButton.click()
          this.$store.dispatch('taskLoading', true)
        } else {
          this.$store.dispatch('setAlert', action)
          this.$store.dispatch('setCurrentTask', '')
          this.$store.dispatch('taskLoading', false)
        }
      }
    })
*/
}

methods.fileInputLoaded = function () {
  document.querySelector('#uploadButton').disabled = false
  document.querySelector('#uploadButton').style.color = 'white'
  document.querySelector('#uploadButton').style.backgroundColor = 'green'
/*
  console.log(ele)
  let files = ele.target.files || ele.dataTransfer.files
  console.log(files)
  const postData = {
    form_num: this.taskStore.currentTask.form_num,
    task_id: this.taskStore.currentTask.id,
    file_upload: files
  }
  this.$http.post(uploadFile, postData)
    .then(response => {
      console.log(response)
    })
  this.errors = {};
  let files = ele.target.files || ele.dataTransfer.files;
  let prop = this.makeTempPropName(ele.target.name);
  if (!files.length) {
      return;
  }

  let formData = new FormData();

  formData.append('_token', this.token);

  formData.append('image', files[0]);

  this.form.append(ele.target.name, files[0]);

  this.$http.post('/tempimages', formData).then((response) => {
      this[prop] = response.data;
  }, (response) => {
      this.setErrors({ [ele.target.name]: response.data['image']});
  });
*/
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
      receiver: '',
      task: '',
      fileUpload: '',
      fileUploaded: false,
      loading: '',
      domain: apiDomain
    }
  },
  methods: methods,
  watch: {
    'workers': function () {
      this.$store.dispatch('taskLoading', false)
    }
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore,
      userStore: state => state.userStore,
      alert: state => state.taskStore.alert,
      taskLoading: state => state.taskStore.taskLoading
    })
  },
  created: function () {
    /*
    this.getWorkers()
    */
  }
}
