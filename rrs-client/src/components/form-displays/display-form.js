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
      loading: state => state.taskStore.loading,
      currentTask: state => state.taskStore.currentTask,
      stage: state => state.taskStore.stage
    })
  }
}
