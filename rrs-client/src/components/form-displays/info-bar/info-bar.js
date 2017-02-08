var methods = {}
import {getWholeWorkflow, getArtpack} from './../../../config'
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

methods.getArtpack = function () {
  const postData = {
    task_id: this.currentTask.id
  }
  console.log('current form is trying')
  this.$http.post(getArtpack, postData)
    .then(response => {
      if (response.status === 200) {
        this.$store.dispatch('setCurrentForm', response.data[0])
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
  computed: {
    ...mapState({
      currentForm: state => state.taskStore.currentForm,
      workflow: state => state.workflowStore.currentWorkflow,
      currentTask: state => state.taskStore.currentTask
    })
  },
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
      this.getArtpack()
    }
  }
}
