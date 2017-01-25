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
      workflow: state => state.workflowStore.currentWorkflow
    })
  }
}
