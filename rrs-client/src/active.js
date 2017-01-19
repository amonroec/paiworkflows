var methods = {}

methods.setTask = function (task) {
  this.task = task
  return
}

methods.getTask = function () {
  return this.task
}

methods.setWorkflow = function (id) {
  this.workflowId = id
  return
}

methods.getWorkflowId = function () {
  return this.workflowId
}

methods.setCurrentUser = function (user) {
  /*
  this.user.name = user['name']
  this.user.email = user['email']
  this.user.division = user['division']
  this.user.access_level = user['access_level']
  */
  this.name = user.name
  this.email = user.email
  this.division = user.division
  this.access_level = user.access_level
  return
}

methods.getCurrentUser = function () {
  var currentUser = {
    name: this.name,
    email: this.email,
    division: this.division,
    access_level: this.access_level
  }
  return currentUser
}

module.exports = {
  name: 'active',
  data: function () {
    return {
      task: {},
      workflowId: '',
      name: '',
      email: '',
      division: '',
      access_level: ''
    }
  },
  methods: methods
}
