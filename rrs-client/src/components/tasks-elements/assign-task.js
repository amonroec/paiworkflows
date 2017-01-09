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
    id: this.order_id,
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
    order_id: ''
  },
  watch: {
    order_id: function (val, oldVal) {
      this.id = val
    }
  },
  created: function () {
    this.getWorkers()
  }
}
