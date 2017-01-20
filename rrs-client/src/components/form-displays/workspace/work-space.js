import {mapState} from 'vuex'

module.exports = {
  data: function () {
    return {
    }
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore
    })
  }
}
