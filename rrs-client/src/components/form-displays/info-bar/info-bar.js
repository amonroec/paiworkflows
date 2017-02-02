var methods = {}
import {getWholeWorkflow} from './../../../config'
import TaskStep from './../../tasks-elements/TaskStep'

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

module.exports = {
  data: function () {
    return {
      stage: '',
      div: '',
      workflowSteps: ''
    }
  },
  components: {
    TaskStep
  },
  methods: methods,
  props: [
    'workflow',
    'currentTask',
    'taskStore'
  ],
  /*
  computed: mapState({
    taskStore: state => state.taskStore,
    stages: state => state.workflowStore.currentWorkflow.stage_num
  })
  */
  watch: {
    workflow: function () {
      console.log('workflowChanged')
      const postData = {
        workflow_id: this.workflow.id
      }
      this.$http.post(getWholeWorkflow, postData)
        .then(response => {
          this.workflowSteps = response.data
        })
    },
    currentTask: function () {
      var currentStep = this.currentTask.status
      console.log(currentStep)
      var count = this.workflowSteps.length
      console.log(count)
      var i
      for (i = 1; i < count; i++) {
        if (this.workflowSteps[i].task_type === currentStep) {
          this.stage = i
        }
        i++
      }
    }
  }
}
