<script>
  import {tasksUrl, getSingleTask} from './../../config'
  import ActivityFeed from './../ActivityFeed'
  export default {
    data: function () {
      return {
        tasks: [],
        inputs: {
          order_id: '',
          table_name: ''
        },
        task: [],
        single_task: [],
        tasks_array: []
      }
    },
    methods: {
      loadTasks () {
        this.$http.get(tasksUrl)
          .then(response => {
            if (response.status === 200) {
              this.tasks = response.data
              console.log(response.data)
              var i = response.data.length
              for (var j = 0; j < i; j++) {
                this.linkData(response.data[j]['order_id'], response.data[j]['table_name'], j)
              }
            } else {
              console.log('noooooo')
            }
          })
      },
      linkData: function (orderId, tableName, count) {
        const postData = {
          order_id: orderId,
          table_name: tableName
        }
        this.loadSingleTasks(postData, count)
      },
      loadSingleTasks (postData, count) {
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
      },
      linkSingleTask (orderId, tableName) {
        var count = this.tasks_array.length
        for (var i = 0; i < count; i++) {
          if (this.tasks_array[i][0]['id'] === parseInt(orderId)) {
            this.single_task = this.tasks_array[i]
          }
        }
      }
    },
    components: {
      ActivityFeed
    },
    created: function () {
      this.loadTasks()
    }
  }
</script>
<template>
  <div id="live-orders">
  <div class="task-bar">
    <div v-for="task in tasks">
        <form class="taskform" v-on:submit.prevent="linkData">
          <input
            type="hidden"
            name="order_id"
            :id="task.order_id"
            :value="task.order_id"
          >
          <input
            type="hidden"
            name="table_name"
            :id="task.table_name"
            :value="task.table_name"
          >
          <a class="task"  href="javascript:void(0)" v-on:click="linkSingleTask(task.order_id, task.table_name)">
            <div>
              {{ task.order_id }}
            </div>
          </a>
        </form>
    </div>
  </div>
    <div id="summaryBar">
      <div v-if="single_task != ''">
        <label name="customer_num">Customer Number: {{ single_task[0]["customer_num"] }} </label>
        <label name="po_num">PO Number: {{ single_task[0]["po_num"] }} </label>
        <label name="due_date">Due Date: {{ single_task[0]["due_date"] }} </label>
      </div>
      <div v-else></div>
    </div>
    <div id="workspace"></div>
    <div class="activity-feed">
      <activity-feed></activity-feed>
    </div>
  </div>
</template>