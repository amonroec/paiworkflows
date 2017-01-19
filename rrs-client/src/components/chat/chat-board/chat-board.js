import ChatEnter from './../chat-enter/ChatEnter'
import ChatDisplay from './../chat-display/ChatDisplay'
import {mapState} from 'vuex'

var methods = {}

methods.setTaskId = function () {
  this.taskId = this.task_id
  console.log('taskIdboard' + this.taskId)
}

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
  watch: {
    task_id: function (val, oldVal) {
      this.setTaskId()
    }
  },
  computed: {
    ...mapState({
      chatStore: state => state.chatStore
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
