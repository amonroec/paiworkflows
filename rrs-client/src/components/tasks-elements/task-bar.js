import {mapState} from 'vuex'
import {getArtpack, getMessages} from './../../config'
var methods = {}

methods.setCurrentTask = function (task) {
  this.$store.dispatch('setCurrentTask', task)
  var workflowId = task.workflow_id
  var workflows = this.workflowStore.workflows
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(workflowId)) {
      that.$store.dispatch('setCurrentWorkflow', workflow)
    }
  })
  console.log(this.workflowStore.currentWorkflow)
  this.getArtpack()
}

methods.getArtpack = function () {
  const postData = {
    task_id: this.taskStore.currentTask.id
  }
  this.$http.post(getArtpack, postData)
    .then(response => {
      if (response.status === 200) {
        this.$store.dispatch('setCurrentForm', response.data[0])
        this.getChat()
      }
    })
}

methods.getChat = function () {
  const postData = {
    task_id: this.taskStore.currentTask.id
  }
  this.$http.post(getMessages, postData)
    .then(response => {
      if (response.data.length === 0) {
        var array = []
        var obj = {
          name: '',
          text: 'No Messages',
          date: ''
        }
        array.push(obj)
        this.$store.dispatch('setCurrentChat', array)
      } else {
        console.log(response.data)
        this.$store.dispatch('setCurrentChat', response.data[0].messages)
      }
    })
}

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore
    })
  }
}
