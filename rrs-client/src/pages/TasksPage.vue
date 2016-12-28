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