import {getWorkers, assignTask} from './../../config'
var methods = {}

methods.getWorkers = function () {
  var division = window.sessionStorage.getItem('userDivision')
  var accessLevel = window.sessionStorage.getItem('accessLevel')
  const postData = {
    division: division,
    accessLevel: accessLevel
  }
  this.$http.post(getWorkers, postData)
    .then(response => {
      if (response.status === 200) {
        this.workers = response.data
        console.log(response.data)
      } else {
        console.log('falieddddd')
      }
    })
}

methods.assignTask = function () {
  const postData = {
    id: this.request_id,
    worker_id: this.selectedWorker
  }
  console.log(postData)
  this.$http.post(assignTask, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response)
      }
    })
}

methods.submitForApproval = function () {
  console.log(this.stage)
}

module.exports = {
  name: 'assignTask',
  data: function () {
    return {
      workers: [],
      selectedWorker: 'assignWorker',
      id: ''
    }
  },
  methods: methods,
  props: {
    request_id: '',
    stage: ''
  },
  watch: {
    request_id: function (val, oldVal) {
      console.log(this.stage)
    }
  },
  created: function () {
    this.getWorkers()
  }
}
