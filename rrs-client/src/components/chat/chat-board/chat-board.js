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
  props: {
    task_id: ''
  },
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
  created: function () {
    this.$store.dispatch('setChatMessages')
  },
  components: {
    ChatEnter,
    ChatDisplay
  }
}
