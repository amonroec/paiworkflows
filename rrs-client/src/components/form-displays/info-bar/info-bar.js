var methods = {}
import {getWholeWorkflow} from './../../../config'
import TaskStep from './../../tasks-elements/TaskStep'
import {mapState} from 'vuex'

methods.getWorkflowSteps = function () {
  const postData = {
    workflow_id: this.workflow.id
  }
  this.$http.post(getWholeWorkflow, postData)
    .then(response => {
      if (response === 200) {
        console.log(response)
      }
    })
}

methods.changeInTask = function () {
  this.$router.push('/home')
}

module.exports = {
  data: function () {
    return {
      div: ''
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
      authUser: state => state.userStore.authUser,
      currentWorkflow: state => state.workflowStore.currentWorkflow,
      currentTask: state => state.taskStore.currentTask,
      stage: state => state.taskStore.stage
    })
  },
  watch: {
    'currentTask': function () {
      console.log(this.currentWorkflow)
    }
  },
  created: function () {
    console.log(this.currentWorkflow)
  }
}
