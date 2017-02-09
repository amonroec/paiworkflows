import TaskBar from './../../components/tasks-elements/TaskBar'
import DisplayForm from './../../components/form-displays/DisplayForm'
import {mapState} from 'vuex'
var methods = {}

module.exports = {
  data: function () {
    return {
      display: ''
    }
  },
  methods: methods,
  events: function () {
    return {
      taskclicked: ''
    }
  },
  components: {
    TaskBar,
    DisplayForm
  },
  computed: {
    ...mapState({
      currentTask: state => state.taskStore.currentTask
    })
  },
  watch: {
    currentTask: function () {
      if (this.currentTask === '') {
        this.display = 'home'
      } else {
        this.display = 'task'
      }
    }
  },
  created: function () {
    var str = window.location.href
    var n = str.lastIndexOf('/')
    var result = str.substring(n + 1)
    if (result === 'home') {
      this.display = 'home'
    } else {
      this.display = 'task'
    }
  }
}
