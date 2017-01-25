import TaskBar from './../../components/tasks-elements/TaskBar'
import DisplayForm from './../../components/form-displays/DisplayForm'
var methods = {}

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  events: {
    'setCurrentWorkflow': function (data) {
      this.$broadcast('passWorkflow', data)
    }
  },
  components: {
    TaskBar,
    DisplayForm
  }
}
