var Active = require('./active.js')

methods.pullWorkflow = function () {
  const postData = {
    workflow_id: this.workflowId
  }
  this.$http.post(getWholeWorkflow, postData)
    .then(response => {
      this.workflow = response.data
      if (this.workflow[0].needs_assigned === 1) {
        this.task.app_worker = this.workflow[0].assigner
        this.task.stage = .5
      } else {
        this.task.stage
      }
    })
}

methods.getWorkflowId = function () {
  this.workflowId = Active.methods.getWorkflowId()
  return this.workflowId
}

module.exports = {
  data: function () {
    return {
      workflowId: '',
      workflow: [],
      task: {
        app_worker: '',
        stage: ''
      }
    }
  },
  methods: methods,
  created: function () {
    this.getWorkflowId()
  }
}
