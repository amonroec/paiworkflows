import {getAllTasks} from './../../config'
var methods = {}

methods.getAllTasks = function () {
  this.$http.get(getAllTasks)
    .then(response => {
      this.all_tasks = response.data
      console.log(this.all_tasks)
    })
}

module.exports = {
  data: function () {
    return {
      all_tasks: ''
    }
  },
  methods: methods,
  events: {
    'setCurrentWorkflow': function (data) {
      this.$broadcast('passWorkflow', data)
    }
  },
  created: function () {
    this.getAllTasks()
  }
}
