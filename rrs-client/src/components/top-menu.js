import {getWorkflows} from './../config'
import {mapState} from 'vuex'

var methods = {}

methods.getUser = function () {
  this.name = window.sessionStorage.getItem('userName')
}

methods.getWorkflows = function () {
  this.$http.post(getWorkflows)
  .then(response => {
    this.workflows = response.data
    /*
    this.$store.dispatch('setWorkflows', this.workflows)
    */
    console.log(this.workflows)
  })
}

methods.workflowClick = function (workflow) {
  /*
  this.$store.dispatch('setCurrentWorkflow', workflow)
  console.log(workflow)
  if (workflow.form_name === 'artpack') {
    this.$router.push({name: 'artpackForm'})
  }
  */
  console.log(workflow)
  window.location = 'http://localhost:8000/asi.php?workflow_id=' + workflow.id
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      name: '',
      workflows: []
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      userStore: state => state.userStore,
      workflowStore: state => state.workflowStore
    })
  },
  created: function () {
    this.getWorkflows()
  }
}
