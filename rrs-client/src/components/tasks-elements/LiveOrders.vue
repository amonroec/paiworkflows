<script>
  import {tasksUrl} from './../../config'
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
    },
    created: function () {
      this.loadTasks()
    }
  }
</script>
<template v-on:load="loadTasks()">
	<div id="live-orders">
  	<div class="task" v-for="task in tasks">
    {{ task.order_id }} - {{ task.table_name }}
    </div>
   </div>
</template>
<style>
#live-orders {
	width:100%;
	border-radius: 5px;
	background-color:green;
	margin-top:10px;
}
.task {
  width:100%;
  height:100px;
  background-color: grey;
  margin-top: 5px;
}
</style>