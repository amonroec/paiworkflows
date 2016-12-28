<script>
  import {tasksUrl, singleTask} from './../../config'
  export default {
    data: function () {
      return {
        tasks: [],
        inputs: {
          order_id: '',
          table_name: ''
        }
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
          order_id: inputs.srcElement[0].id,
          table_name: inputs.srcElement[1].id
        }
        console.log(inputs.srcElement[0].id)
        this.$http.post(singleTask, postData)
          .then(response => {
            console.log(response.data)
            this.$router.push({name: 'dashboard'})
          })
      }
    },
    created: function () {
      this.loadTasks()
    }
  }
</script>
<template>
  <div id="live-orders">
    <div v-for="task in tasks">
        <form class="taskform" v-on:submit.prevent="linkData">
          <input
            type="text"
            name="order_id"
            :id="task.order_id"
            :value="task.order_id"
          >
          <input
            type="text"
            name="table_name"
            :id="task.table_name"
            :value="task.table_name"
          >
          <input type="submit" name="submit"></input>

          <!--<a href="javascript:void(0)" v-on:click="linkData">-->
            <div class="task">
              {{ task.order_id }} - {{ task.table_name }}
            </div>
          <!--</a>-->
        </form>
    </div>
   </div>
</template>
<style>
#live-orders {
  width:100%;
  border-radius: 5px;
  margin-top:10px;
}
.task {
  width:100%;
  height:100px;
  background-color: grey;
  margin-top: 5px;
}
</style>