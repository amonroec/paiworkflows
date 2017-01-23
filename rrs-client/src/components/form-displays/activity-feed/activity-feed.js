import ChatBoard from './../../chat/chat-board/ChatBoard'
import {mapState} from 'vuex'
var methods = {}

module.exports = {
  data: function () {
    return {
      taskId: ''
    }
  },
  methods: methods,
  components: {
    ChatBoard
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore
    })
  }
}
