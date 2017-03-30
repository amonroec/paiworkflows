import ChatEnter from './../chat-enter/ChatEnter'
import ChatDisplay from './../chat-display/ChatDisplay'
import {mapState} from 'vuex'

var methods = {}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      taskId: ''
    }
  },
  methods: methods,
  currentTask: function () {
    this.getChat()
  },
  computed: {
    ...mapState({
      chatStore: state => state.chatStore,
      currentTask: state => state.taskStore.currentTask,
      taskStore: state => state.taskStore
    })
  },
  components: {
    ChatEnter,
    ChatDisplay
  }
}
