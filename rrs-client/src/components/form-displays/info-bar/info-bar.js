var methods = {}
import {getWholeWorkflow} from './../../../config'
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

module.exports = {
  data: function () {
    return {
      stages: '',
      div: '',
      workflowSteps: ''
    }
  },
  methods: methods,
  props: [
    'workflow'
  ],
  /*
  computed: mapState({
    taskStore: state => state.taskStore,
    stages: state => state.workflowStore.currentWorkflow.stage_num
  })
  */
  computed: {
    ...mapState({
      taskStore: state => state.taskStore
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
          console.log(response)
          this.workflowSteps = response.data
        })
    }
  }
}
