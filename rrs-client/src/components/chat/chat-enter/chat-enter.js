import {submitChat} from './../../../config.js'

var methods = {}

methods.getNameId = function () {
  this.message.name = window.sessionStorage.getItem('userName')
  this.message.id = window.sessionStorage.getItem('userId')
}

methods.submitChat = function () {
  const postData = {
    task_id: this.taskId,
    message: this.message
  }
  console.log(postData)
  this.$http.post(submitChat, postData)
    .then(response => {
      console.log(response.data)
    })
}

methods.getDate = function () {}

methods.setTaskId = function () {
  this.taskId = this.task_id
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
      taskId: ''
    }
  },
  methods: methods,
  props: {
    task_id: ''
  },
  watch: {
    task_id: function (val, oldVal) {
      this.setTaskId()
    }
  },
  created: function () {
    this.getNameId()
    this.setTaskId()
    this.getDate()
  }
}
