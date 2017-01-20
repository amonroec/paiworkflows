<template>
<div id="live-orders">
  <div class="task-bar">
    <h2>Current Tasks</h2>
    <div v-for="task in taskStore.tasks">
        <form class="taskform" v-on:submit.prevent="linkData">
          <div class="task-side"><div>
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
          <a class="task" v-if="task.table_name === 'embroidery'"  href="javascript:void(0)" v-on:click="setCurrentTask(task)">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
          <a class="task" v-if="task.table_name === 'artpacks'"  href="javascript:void(0)" v-on:click="setCurrentTask(task)">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td>{{ task.id }}</td>
                    <td>{{ task.table_name }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
        </form>
    </div>
    <div v-if="tasks_array.length <= 0">
      <h3>You have no tasks assigned</h3>
    </div>
  </div>
  <div id="displayForm">
  </div>
</div>
</template>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
module.exports = require('./live-requests.js')
</script>