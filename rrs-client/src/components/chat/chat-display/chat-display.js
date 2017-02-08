import {mapState} from 'vuex'
import {getMessages} from './../../../config'
var methods = {}

methods.getChat = function () {
  const postData = {
    task_id: this.task_id
  }
  this.$http.post(getMessages, postData)
    .then(response => {
      if (response.data.length === 0) {
        var array = []
        var obj = {
          name: '',
          text: 'No Messages',
          date: '',
          action: ''
        }
        array.push(obj)
        this.$store.dispatch('setCurrentChat', array)
      } else {
        this.$store.dispatch('setCurrentChat', response.data[0].messages)
      }
    })
}

module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      currentChat: state => state.taskStore.currentChat,
      userStore: state => state.userStore
    })
  },
  props: [
    'task_id'
  ],
  watch: {
    'task_id': function () {
      console.log('id has changed')
      this.getChat()
    }
  }
}
