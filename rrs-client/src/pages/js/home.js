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
      console.log('whooooohoooooo')
    }
  },
  components: {
    TaskBar,
    DisplayForm
  }
}
