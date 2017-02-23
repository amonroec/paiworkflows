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

methods.toggleSubcat = function (val) {
  this.subcat = val
}

methods.workflowClick = function (workflow) {
  /*
  this.$store.dispatch('setCurrentWorkflow', workflow)
  console.log(workflow)
  if (workflow.form_name === 'artpack') {
    this.$router.push({name: 'artpackForm'})
  }
  */
  window.location = 'http://server.paiworkflows.com/asi.php?workflow_id=' + workflow.id
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      name: '',
      workflows: [],
      subcat: 'no'
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
