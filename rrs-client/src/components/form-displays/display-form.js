import ActivityFeed from './activity-feed/ActivityFeed'
import InfoBar from './info-bar/InfoBar'
import WorkSpace from './workspace/WorkSpace'
import {mapState} from 'vuex'
var methods = {}

methods.activityFeedToggle = function (val, activity) {
  this.activityFeedShow = val
  this.activityToggle = activity
}

module.exports = {
  name: 'artpack-display',
  data: function () {
    return {
      activityFeedShow: true,
      activityToggle: 'activity-show'
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
      workflowStore: state => state.workflowStore,
      taskLoading: state => state.taskStore.taskLoading,
      currentTask: state => state.taskStore.currentTask,
      stage: state => state.taskStore.stage
    })
  },
  created: function () {
    var currentStep = this.taskStore.currentTask.status
    var i = 0
    var that = this
    this.workflowStore.currentWorkflow.forEach(function (workflow) {
      if (workflow.task_type === currentStep) {
        that.$store.dispatch('setStage', i)
      }
      i++
    })
  }
}
