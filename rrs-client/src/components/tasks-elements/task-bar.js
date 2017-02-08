import {mapState} from 'vuex'
var methods = {}

methods.setCurrentTask = function (task) {
  /*
  this.$store.dispatch('setCurrentTask', task)
  var workflowId = task.workflow_id
  var workflows = this.workflowStore.workflows
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(workflowId)) {
      that.$store.dispatch('setCurrentWorkflow', workflow)
    }
  })
  this.getArtpack()
*/
  this.$router.push('/home/' + task.id)
}

methods.setCurrentTaskOther = function (taskId) {
  this.$router.push('/home/' + taskId)
}

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore
    })
  },
  created: function () {
    var str = window.location.href
    var n = str.lastIndexOf('/')
    var result = str.substring(n + 1)
    if (result !== 'home') {
      this.setCurrentTaskOther(result)
    }
  }
}
