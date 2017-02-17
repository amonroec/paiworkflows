import ActivityFeed from './activity-feed/ActivityFeed'
import InfoBar from './info-bar/InfoBar'
import WorkSpace from './workspace/WorkSpace'
import {mapState} from 'vuex'
var methods = {}

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
      workflowStore: state => state.workflowStore,
      loading: state => state.taskStore.loading,
      alert: state => state.taskStore.alert,
      currentTask: state => state.taskStore.currentTask,
      stage: state => state.taskStore.stage
    })
  },
  watch: {
    'workflowStore.currentWorkflow': function () {
      var currentStep = this.currentTask.status
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
    this.$watch('alert', function () {
      that.$router.push('/home')
    })
  }
}
