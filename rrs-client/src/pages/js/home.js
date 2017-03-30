import TaskBar from './../../components/tasks-elements/TaskBar'
import DisplayForm from './../../components/form-displays/DisplayForm'
import {mapState} from 'vuex'
var methods = {}
/*
methods.taskClicked = function (taskId) {
  this.$store.dispatch('isLoading', true)
  window.localStorage.setItem('currentTask', taskId)
  this.setCurrentTask(taskId)
}

methods.setCurrentTask = function (task) {
  this.$store.dispatch('isLoading', true)
  var load = this.$store.dispatch('setCurrentTask', task)
  var that = this
  load.then(function () {
    that.$emit('taskSet', task)
  })
}

methods.setCurrentForm = function (task) {
  var formLoad = this.$store.dispatch('setCurrentForm', task.id)
  formLoad.then(this.$emit('formSet'))
}

methods.setCurrentWorkflow = function (task) {
  var workflows = this.workflowStore.workflows
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(task.workflow_id)) {
      var load = that.$store.dispatch('setCurrentWorkflow', workflow.id)
      load.then(function () {
        that.$emit('workflowSet')
      })
    }
  })
}
*/

module.exports = {
  data: function () {
    return {
      display: ''
    }
  },
  methods: methods,
  components: {
    TaskBar,
    DisplayForm
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      taskLoading: state => state.taskStore.taskLoading,
      tasksLoading: state => state.taskStore.tasksLoading,
      workflowStore: state => state.workflowStore,
      alert: state => state.taskStore.alert
    })
  },
  created: function () {
    var cTask = window.localStorage.getItem('currentTask')
    var cWorkflow = window.localStorage.getItem('currentWorkflow')
    var that = this
    if (cTask !== null) {
      that.$store.dispatch('setCurrentTask', JSON.parse(cTask))
      that.$store.dispatch('setCurrentWorkflow', cWorkflow)
    }
  }
}
