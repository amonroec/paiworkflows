import {mapState} from 'vuex'
import TaskStep from './../../tasks-elements/TaskStep'

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
      taskStore: state => state.taskStore
    })
  }
}
