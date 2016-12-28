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
              var i = response.data.length
              for (var j = 0; j < i; j++) {
                this.linkData(response.data[j]['order_id'], response.data[j]['table_name'])
              }
            } else {
              console.log('noooooo')
            }
          })
      },
      linkData: function (orderId, tableName) {
        const postData = {
          order_id: orderId,
          table_name: tableName
        }
        this.loadSingleTasks(postData)
      },
      loadSingleTasks (postData) {
        this.$http.post(getSingleTask, postData)
        .then(response => {
          if (response.status === 200) {
            this.single_task = response.data
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
<style>
#live-orders {
  width:100%;
  float:left;
  border-radius: 5px;
  margin-top:10px;
}
.task {
  margin-top: 5px;
  text-decoration: none;
  text-align: center;
}
.task div {
  width:100%;
  height:60px;
  background-color: #789f31;
  margin-top: 10px;
  font-size: 20px;
  line-height: 60px;
}
.task-bar {
  width:240px;
  height: calc(100vh - 100px);
  float:left;
  background-color: #000;
}
#summaryBar {
  width:calc(100% - 240px);
  height:160px;
  background-color:grey;
  float:left;
}
#workspace {
  width:calc(70vw - 240px);
  height:calc(100vh - 260px);
  background-color:$brand-warning;
  float:left;
}
.activity-feed {
  width:calc(30vw);
  height:calc(100vh - 260px);
  float:left;
}
</style>