import {getMessages} from './../../../config'
var methods = {}

methods.getMessages = function () {
  const postData = {
    task_id: this.taskId
  }
  console.log(postData)
  this.$http.post(getMessages, postData)
    .then(response => {
      this.messages = response.data[0].messages
      console.log(this.messages)
    })
}

methods.setTaskId = function () {
  this.taskId = this.task_id
  this.messages = ''
}

module.exports = {
  data: function () {
    return {
      messages: {},
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
      this.getMessages()
    }
  },
  created: function () {
    this.setTaskId()
    this.getMessages()
  }
}
