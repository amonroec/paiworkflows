import {getAllTasks, formDomain, searchForms} from './../../config'
import DisplayForm from './../../components/form-displays/DisplayForm'
import {mapState} from 'vuex'
var methods = {}

methods.getAllTasks = function () {
  this.loading = true
  this.searchNotFound = true
  this.$http.get(getAllTasks)
    .then(response => {
      this.all_tasks = response.data
    })
}

methods.filterTasks = function () {
  this.loading = true
  switch (this.selectFilter) {
    case 'all':
      if (this.searchValue === '') {
        this.getAllTasks()
      } else {
        this.getFilterTasks(this.searchValue, 'task', this.selectAllSearch)
      }
      break
    case 'artpack':
      if (this.searchValue === '') {
        this.getFilterTasks('*', 'artpack', this.selectForm)
      } else {
        this.getFilterTasks(this.searchValue, 'artpack', this.selectForm)
      }
      break
    case 'embroidery':
      if (this.searchValue === '') {
        this.getFilterTasks('*', 'embroidery')
      } else {
        this.getFilterTasks(this.searchValue, 'embroidery')
      }
      break
    default:
      return
  }
}

methods.viewTask = function (task) {
  this.searchTable = true
  this.$store.dispatch('taskLoading', true)
  var load = this.$store.dispatch('setCurrentTask', task)
  var that = this
  load.then(function () {
    that.$emit('taskSet', task)
  })
}

methods.setCurrentWorkflow = function (task) {
  var workflows = this.workflowStore.workflows
  var that = this
  workflows.forEach(function (workflow) {
    if (parseInt(workflow.id) === parseInt(task.workflow_id)) {
      var load = that.$store.dispatch('setCurrentWorkflow', workflow.id)
      load.then(function () {
        that.$emit('workflowSet')
      })
    }
  })
}

methods.getFilterTasks = function (val, form, where) {
  const postData = {
    search_value: val,
    search_type: form,
    search_where: where
  }
  console.log(postData)
  this.$http.post(searchForms, postData)
    .then(response => {
      if (response.status === 200) {
        this.searchNotFound = true
        if (response.data.length === 0 || response.data === undefined) {
          this.searchNotFound = false
          this.loading = false
        }
        this.all_tasks = response.data
        console.log(response.data.length)
        console.log(response.data)
      } else {
        this.searchNotFound = false
        this.loading = false
      }
    })
  console.log(this.searchNotFound)
}

methods.searchTableShow = function () {
  this.searchTable = false
}

methods.clear = function () {
  this.searchValue = ''
  this.filterTasks()
}

module.exports = {
  data: function () {
    return {
      searchValue: '',
      selectFilter: 'all',
      selectAllSearch: 'form_num',
      selectForm: 'all',
      selectOptions: [
        { text: 'All', value: 'all' },
        { text: 'Artpack', value: 'artpack' },
        { text: 'Embroidery', value: 'embroidery' }
      ],
      selectAllOptions: [
        { text: 'Form #', value: 'form_num' },
        { text: 'Working Artist', value: 'app_artist' },
        { text: 'CSR Assigned', value: 'csr_assigned' },
        { text: 'Submitted By', value: 'submitted_by' },
        { text: 'Status', value: 'status' }
      ],
      selectFormOptions: [
        { text: 'All', value: 'all' },
        { text: 'Account Name', value: 'account_name' },
        { text: 'Account #', value: 'account_num' },
        { text: 'Customer Name', value: 'customer_name' },
        { text: 'Form #', value: 'artpack_num' },
        { text: 'Rep Name', value: 'rep_name' }
      ],
      all_tasks: '',
      formDomain: formDomain,
      searchNotFound: true,
      searchTable: false,
      loading: ''
    }
  },
  methods: methods,
  components: {
    DisplayForm
  },
  computed: {
    ...mapState({
      taskStore: state => state.taskStore,
      taskLoading: state => state.taskStore.taskLoading,
      workflowStore: state => state.workflowStore,
      alert: state => state.taskStore.alert
    })
  },
  watch: {
    'workflowStore.currentWorkflow': function () {
      var currentStep = this.taskStore.currentTask.status
      var workflows = this.workflowStore.currentWorkflow
      var i = 0
      var that = this
      workflows.forEach(function (workflow) {
        if (workflow.task_type === currentStep) {
          that.$store.dispatch('setStage', i)
          that.$store.dispatch('taskLoading', false)
        }
        i++
      })
    },
    'all_tasks': function () {
      console.log('tasks changed')
      this.loading = false
    }
  },
  created: function () {
    this.getAllTasks()
    var that = this
    this.$on('taskSet', function (task) {
      that.setCurrentWorkflow(task)
    })
  }
}
