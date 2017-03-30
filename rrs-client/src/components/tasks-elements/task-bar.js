import {mapState} from 'vuex'
import SingleTask from './SingleTask'
import Pusher from 'pusher-js'
var methods = {}

methods.setCurrentTask = function (task) {
  /*
  this.$store.dispatch('setCurrentTask', task)
  var workflowId = task.workflow_id
  var workflows = this.workflowStore.workflows
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(workflowId)) {
      that.$store.dispatch('setCurrentWorkflow', workflow)
    }
  })
  this.getArtpack()this.$router.push('/home/' + task.id)this.$emit('task_clicked', task)
*/
}

methods.setCurrentTaskOther = function (taskId) {
  this.$router.push('/home/' + taskId)
}

methods.taskChanged = function (data) {
  console.log(this.finalTasks)
  var newTask = data.newTask
  this.finalTasks.forEach(function (task, i) {
    if (parseInt(task.id) === parseInt(newTask.id)) {
      this.finalTasks[i].task = newTask
    }
  })
  console.log(this.finalTasks)
}

methods.taskHasChanged = function (data) {
  this.$emit('taskHasChanged', data)
}

module.exports = {
  data: function () {
    return {
      userId: '',
      finalTasks: '',
      groupCheck: '',
      // 9ca3eda463882645ca10 - 833b00244057e8fa2fd0
      pusher: new Pusher('9ca3eda463882645ca10', {
        encrypted: true,
        cluster: 'mt1'
      }),
      notActiveTasks: []
    }
  },
  methods: methods,
  components: {
    SingleTask
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      workflowStore: state => state.workflowStore,
      userStore: state => state.userStore,
      tasksLoading: state => state.taskStore.tasksLoading,
      tasks: state => state.taskStore.tasks
    })
  },
  watch: {
    'tasks': function () {
      this.finalTasks = this.tasks
    }
  },
  created: function () {
    this.finalTasks = this.tasks
    var that = this
    this.taskChannel = this.pusher.subscribe('new_task')
    this.taskChannel.bind('new_task_requested', function (data) {
      console.log('task changed')
      that.$emit('task_changed', data)
    })
  }
}
