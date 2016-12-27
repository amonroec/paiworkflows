<script>
  import {tasksUrl} from './../config'
  export default {
    data () {
      return {
        tasks: []
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
      }
    }
  }
</script>
<template>
<div id="tasksPage">
  <div id="overview-box"></div>
  <button v-on:click="loadTasks()" value="Click!"></button>
  <div id="tasks-holder">
    <div class="task" v-for="task in tasks">
    {{ task.order_id }} - {{ task.table_name }}
    </div>
  </div>
</div>
</template>
<style>
#overview-box {
  width:100%;
  height:160px;
  border-radius: 5px;
  background-color:grey;
  margin-top:10px;
}
#tasks-holder {
  width:100%;
  background-color:green;
}
.task {
  width:100%;
  height:100px;
  background-color: grey;
  margin-top: 5px;
}
</style>