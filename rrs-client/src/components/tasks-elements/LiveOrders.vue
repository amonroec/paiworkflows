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
        single_task: []
      }
    },
    methods: {
      loadTasks () {
        this.$http.get(tasksUrl)
          .then(response => {
            if (response.status === 200) {
              console.log(response.data)
              this.tasks = response.data
            } else {
              console.log('noooooo')
            }
          })
      },
      linkData: function (inputs) {
        const postData = {
          order_id: inputs.path[2].order_id._value,
          table_name: inputs.path[2].table_name._value
        }
        this.loadSingleTasks(postData)
      },
      loadSingleTasks (postData) {
        this.$http.post(getSingleTask, postData)
        .then(response => {
          if (response.status === 200) {
            console.log(response.data)
            this.single_task = response.data
          } else {
            console.log('noooooo')
          }
        })
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
          <a class="task" href="javascript:void(0)" v-on:click="linkData($event)">
            <div>
              {{ task.order_id }} - {{ task.table_name }}
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
  background-color: grey;
  margin-top: 10px;
}
.task-bar {
  width:240px;
  height: calc(100vh - 100px);
  float:left;
  background-color: green;
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
  background-color:green;
  float:left;
}
.activity-feed {
  width:calc(30vw);
  height:calc(100vh - 260px);
  float:left;
}
</style>