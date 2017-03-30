var methods = {}
import {getWholeWorkflow, getWorker, unclaim} from './../../../config'
import TaskStep from './../../tasks-elements/TaskStep'
import {mapState} from 'vuex'

methods.getWorkflowSteps = function () {
  const postData = {
    workflow_id: this.workflow.id
  }
  this.$http.post(getWholeWorkflow, postData)
    .then(response => {
      if (response === 200) {
      }
    })
}

methods.changeInTask = function () {
  this.$router.push('/home')
}

methods.unclaimTask = function () {
  var t = this.currentTask.id
  var mess = this.getMessage('unclaim-task', 'Task has been unclaimed.')
  const postData = {
    taskId: t,
    message: mess
  }
  console.log(postData)
  this.$http.post(unclaim, postData)
    .then(response => {
      console.log(response)
    })
}

methods.getMessage = function (action, text) {
  this.message.name = this.userStore.authUser.name
  this.message.id = this.userStore.authUser.id
  this.message.text = text
  var date = new Date()
  var n = date.toLocaleString()
  this.message.date = n
  this.message.action = action
  this.message.user_picture = this.userStore.authUser.picture
  var array = []
  /* this.taskStore.currentTask.messages.forEach(function (mess) {
    array.push(mess)
  }) */
  var otherArray = this.currentTask.messages
  array.push(this.message)
  var finalArray = otherArray.concat(array)
  return finalArray
}

module.exports = {
  data: function () {
    return {
      div: '',
      claimer: null,
      message: {
        name: '',
        id: '',
        text: '',
        date: '',
        action: '',
        user_picture: ''
      }
    }
  },
  components: {
    TaskStep
  },
  methods: methods,
  computed: {
    ...mapState({
      currentForm: state => state.taskStore.currentForm,
      workflows: state => state.workflowStore.workflows,
      userStore: state => state.userStore,
      currentWorkflow: state => state.workflowStore.currentWorkflow,
      currentTask: state => state.taskStore.currentTask,
      stage: state => state.taskStore.stage
    })
  },
  created: function () {
    if (this.currentTask.app_artist !== null) {
      const postData = {
        userId: this.currentTask.app_artist
      }
      console.log(postData)
      this.$http.post(getWorker, postData)
        .then(response => {
          if (response.status === 200) {
            this.claimer = response.data[0]
          }
        })
    }
    console.log(this.currentTask)
  }
}
