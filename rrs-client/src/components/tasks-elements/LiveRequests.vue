<template>
<div id="live-orders">
  <div class="task-bar">
    <h2>Current Tasks</h2>
    <div v-for="task in tasks_array">
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
          <a class="task" v-if="task[1][0] === 'embroidery'"  href="javascript:void(0)" v-on:click="setSingleTask(task[0][0].id, task[1][0])">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td>{{ task[1][0] }}</td>
                    <td>{{ task[0][0].id }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
          <a class="task" v-if="task[1][0] === 'artpacks'"  href="javascript:void(0)" v-on:click="setSingleTask(task)">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td>{{ task[1][0] }}</td>
                    <td>{{ task[0][0].id }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
        </form>
    </div>
  </div>
  <div id="displayForm">
    <artpack-display v-if="table_name === 'artpacks'" transition="fade" transition-mode="out-in" :active_array.sync="active_array.task_array"></artpack-display>
  </div>
</div>
</template>
<script>
module.exports = require('./live-requests.js')
</script>