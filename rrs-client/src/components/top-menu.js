import {getWorkflows, apiDomain} from './../config'
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
  })
}

methods.toggleSubcat = function (val) {
  this.subcat = val
}

methods.goToHome = function () {
  this.$store.dispatch('setCurrentTask', '')
  window.localStorage.removeItem('currentTask')
  window.localStorage.removeItem('currentWorkflow')
  this.$router.push({name: 'home'})
}

methods.logout = function () {
  window.localStorage.removeItem('authUser')
  window.localStorage.removeItem('currentTask')
  window.localStorage.removeItem('currentWorkflow')
  this.$store.dispatch('logout').then(this.$router.push({name: 'login'}))
  console.log('logout')
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      name: '',
      workflows: [],
      subcat: 'no',
      domain: apiDomain
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
