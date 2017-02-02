import TaskStep from './../../tasks-elements/TaskStep'

module.exports = {
  data: function () {
    return {
      iframe_url: ''
    }
  },
  components: {
    TaskStep
  },
  props: [
    'taskStore'
  ]
}
