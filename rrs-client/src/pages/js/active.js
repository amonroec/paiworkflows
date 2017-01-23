import Vue from 'vue'
import VueResource from 'vue-resource'
import {getLiveTask, getWholeWorkflow} from './../../../config'

Vue.use(VueResource)
var methods = {}

methods.submitForm = function (taskId) {
  this.getActualTask(taskId)
  this.getWorkflow(this.task.workflow_id)
  console.log(this.workflow)
  return 'done'
}

methods.getWorkflow = function (workflowId) {
  const postData = {
    workflow_id: workflowId
  }
  this.$http.post(getWholeWorkflow, postData)
    .then(response => {
      if (response === 200) {
        this.workflow = response.data
        console.log(this.workflow)
      }
    })
}

methods.setNextStage = function (taskId) {
  this.getActualTask(taskId)
  this.getWorkflow(this.task.workflow_id)
  var nextStage = this.task.stage
  if (this.workflow[nextStage].needs_assigned === 1) {
    this.task.app_worker = this.workflow[nextStage].assigner
  } else if (this.workflow[nextStage].approval_type !== 'None') {
    switch (this.workflow[nextStage].approval_type) {
      case 'requesting_person':
        this.task.app_worker = this.task.submitted_by
        break
      case 'other_person':
        this.task.app_worker = this.workflow[nextStage].approval_person
        break
      default:
        this.task.app_worker = ''
    }
  }
}

methods.getActualTask = function (taskId) {
  const postData = {
    task_id: taskId
  }
  console.log(postData)
  VueResource.$http.post(getLiveTask, postData)
    .then(response => {
      console.log(response)
      return response
    })
}

module.exports = {
  name: 'active',
  data: function () {
    return {
      task: '',
      workflow: ''
    }
  },
  methods: methods
}
