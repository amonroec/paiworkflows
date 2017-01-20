import {mapState} from 'vuex'
var methods = {}

methods.setCurrentTask = function (task) {
  this.$store.dispatch('setCurrentTask', task)
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      tasks: [],
      task: [],
      single_task: [],
      tasks_array: [],
      order_id: '',
      active_array: {
        task_array: {}
      },
      table_name: '',
      stage: '',
      data_array: []
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      workflowStore: state => state.workflowStore,
      taskStore: state => state.taskStore
    })
  }
}
