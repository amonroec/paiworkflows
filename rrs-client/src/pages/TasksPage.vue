<script>
  import {tasksUrl} from './../config'
  import LiveOrders from './../components/tasks-elements/LiveOrders'
  export default {
    components: {
      LiveOrders
    },
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
  <live-orders></live-orders>
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
</style>