import {tasksUrl, getSingleTask} from './../../config'
import ArtpackDisplay from './../form-displays/ArtpackDisplay'
var Vue = require('Vue')
var methods = {}

methods.loadTasks = function () {
  this.$http.get(tasksUrl)
    .then(response => {
      if (response.status === 200) {
        this.tasks = response.data
        var i = response.data.length
        for (var j = 0; j < i; j++) {
          /*
          this.linkData(response.data[j]['order_id'], response.data[j]['table_name'], j)
          */
          var groupData = {orderId: response.data[j]['order_id'], tableName: response.data[j]['table_name']}
          this.data_array.push(groupData)
        }
        const postData = {
          array: this.data_array
        }
        this.$http.post(getSingleTask, postData)
          .then(response => {
            if (response.status === 200) {
              this.tasks_array = response.data
              console.log(this.tasks_array)
            }
          })
      } else {
        console.log('noooooo')
      }
    })
}

methods.linkData = function (orderId, tableName, count) {
  const postData = {
    order_id: orderId,
    table_name: tableName
  }
  this.loadSingleTasks(postData, count)
}

methods.loadSingleTasks = function (postData, count) {
  this.$http.post(getSingleTask, postData)
  .then(response => {
    if (response.status === 200) {
      if (count === 0) {
        this.single_task = response.data
      }
      this.tasks_array.push(response.data)
    } else {
      console.log('noooooo')
    }
  })
}

methods.linkSingleTask = function (orderId, tableName) {
  this.order_id = orderId
  this.table_name = tableName
  /*
  var count = this.tasks_array.length
  for (var i = 0; i < count; i++) {
    if (this.tasks_array[i][0]['id'] === parseInt(orderId)) {
      this.single_task = this.tasks_array[i]
    }
  }
  */
}

methods.setSingleTask = function (orderId, tableName) {
  this.order_id = orderId
  this.table_name = tableName
  /*
  const postData = {
    order_id: orderId,
    table_name: tableName
  }

  console.log(postData)
  this.$http.post(setSingleTask, postData)
  .then(response => {
    console.log(response.body)
  })
  */
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      tasks: [],
      task: [],
      single_task: [],
      tasks_array: [],
      order_id: '',
      table_name: '',
      data_array: []
    }
  },
  methods: methods,
  render: Vue.component('artpack-display'),
  created: function () {
    this.loadTasks()
  }
}
