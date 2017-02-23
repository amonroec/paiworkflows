import TaskBar from './../../components/tasks-elements/TaskBar'
import DisplayForm from './../../components/form-displays/DisplayForm'
import {mapState} from 'vuex'
var methods = {}

methods.taskClicked = function (taskId) {
  this.$store.dispatch('isLoading', true)
  window.localStorage.setItem('currentTask', taskId)
  this.setCurrentTask(taskId)
}

methods.setCurrentTask = function (taskId) {
  var tasks = this.taskStore.tasks
  var that = this
  tasks.forEach(function (task) {
    if (parseInt(task.id) === parseInt(taskId)) {
      var load = that.$store.dispatch('setCurrentTask', task)
      load.then(function () {
        that.$emit('taskSet', task)
      })
    }
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
      loading: state => state.taskStore.loading,
      workflowStore: state => state.workflowStore,
      alert: state => state.taskStore.alert
    })
  },
  watch: {
    'workflowStore.currentWorkflow': function () {
      var currentStep = this.taskStore.currentTask.status
      var workflows = this.workflowStore.currentWorkflow
      var i = 0
      var that = this
      workflows.forEach(function (workflow) {
        if (workflow.task_type === currentStep) {
          that.$store.dispatch('setStage', i)
          that.$store.dispatch('isLoading', false)
        }
        i++
      })
    }
  },
  created: function () {
    var that = this
    this.$on('taskSet', function (task) {
      that.setCurrentWorkflow(task)
    })
  }
}
