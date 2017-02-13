import TaskStep from './../../tasks-elements/TaskStep'
import {mapState} from 'vuex'

module.exports = {
  data: function () {
    return {
    }
  },
  components: {
    TaskStep
  },
  computed: {
    ...mapState({
      chatStore: state => state.chatStore,
      currentTask: state => state.taskStore.currentTask,
      taskStore: state => state.taskStore
    })
  }
}
