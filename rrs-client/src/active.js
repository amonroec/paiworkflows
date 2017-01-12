var active = {}

active.setTask = function (task) {
  this.task = task
  return
}

active.getTask = function () {
  return this.task
}

active.setWorkflow = function (id) {
  this.workflowId = id
  return
}

active.getWorkflowId = function () {
  return this.workflowId
}

module.exports = {
  name: 'active',
  data: function (done) {
    return {
      task: {},
      workflowId: ''
    }
  },
  methods: active
}
