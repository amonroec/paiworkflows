import ChatBoard from './chat/chat-board/ChatBoard'
var methods = {}

methods.setTaskId = function () {
  this.taskId = this.task_id
  console.log('taskId' + this.taskId)
}

module.exports = {
  data: function () {
    return {
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
    this.setTaskId()
  },
  components: {
    ChatBoard
  }
}
