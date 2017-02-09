import ActivityFeed from './activity-feed/ActivityFeed'
import InfoBar from './info-bar/InfoBar'
import WorkSpace from './workspace/WorkSpace'
import {mapState} from 'vuex'
var methods = {}

methods.setCurrentTask = function (taskId) {
  var tasks = this.taskStore.tasks
  var that = this
  tasks.forEach(function (task) {
    if (parseInt(task.id) === parseInt(taskId)) {
      that.$store.dispatch('setCurrentTask', task)
    }
  })
  return this.setCurrentWorkflow()
}

methods.setCurrentWorkflow = function () {
  var workflows = this.workflowStore.workflows
  var workflowId = this.taskStore.currentTask.workflow_id
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(workflowId)) {
      that.$store.dispatch('setCurrentWorkflow', workflow)
    }
  })
  return 'success'
}

methods.fetchData = function () {
  this.setCurrentTask(this.$route.params.taskId)
}

module.exports = {
  name: 'artpack-display',
  data: function () {
    return {
    }
  },
  methods: methods,
  components: {
    ActivityFeed,
    InfoBar,
    WorkSpace
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore
    })
  },
  watch: {
    '$route': function () {
      this.setCurrentTask(this.$route.params.taskId)
    }
  },
  created: function () {
    var str = window.location.href
    var n = str.lastIndexOf('/')
    var result = str.substring(n + 1)
    var that = this
    console.log(result)
    if (result !== 'home') {
      setTimeout(function () {
        that.setCurrentTask(result)
      }, 2000)
    }
  }
}
