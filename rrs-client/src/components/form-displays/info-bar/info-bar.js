var methods = {}
import {mapState} from 'vuex'

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      taskStore: state => state.taskStore
    })
  }
}
