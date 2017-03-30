import {mapState} from 'vuex'
var methods = {}
/*
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
*/
methods.scrollBottom = function (time) {
  setTimeout(function () {
    var div = document.querySelector('#chatDisplay')
    div.scrollTop = div.scrollHeight
  }, time)
}
module.exports = {
  data: function () {
    return {
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      currentTask: state => state.taskStore.currentTask.messages,
      userStore: state => state.userStore,
      loading: state => state.taskStore.loading
    })
  },
  watch: {
    'currentTask': function () {
      this.scrollBottom(2000)
    }
  },
  created: function () {
    this.scrollBottom(1000)
  }
}
