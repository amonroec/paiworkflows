import {getWorkflows} from './../config'
var Active = require('./../active.js')
var methods = {}

methods.getUser = function () {
  this.name = window.sessionStorage.getItem('userName')
}

methods.getWorkflows = function () {
  this.$http.get(getWorkflows)
    .then(response => {
      this.workflows = response.data
      console.log(this.workflows)
    })
}

methods.workflowClick = function (form, id) {
  Active.methods.setWorkflow(id)
  if (form === 'artpack') {
    this.$router.push({name: 'artpackForm'})
  }
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      name: '',
      workflows: []
    }
  },
  methods: methods,
  created: function () {
    this.getUser()
    this.getWorkflows()
  }
}
