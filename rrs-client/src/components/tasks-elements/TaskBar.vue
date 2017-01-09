<template>
  <div class="task-bar">
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
          <a class="task" v-if="task[1] === 'embroidery'"  href="javascript:void(0)" v-on:click="setSingleTask(task[0][0].id, task[1])">
            <div>
              <table>
                <tbody>
                  <tr>/
                    <td>{{ task[1] }}</td>
                    <td>{{ task[0][0].id }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
          <a class="task" v-if="task[1] === 'artpacks'"  href="javascript:void(0)" v-on:click="setSingleTask(task[0][0].id, task[1])">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td>{{ task[1] }}</td>
                    <td>{{ task[0][0].id }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </a>
        </form>
    </div>
  </div>
</template>
<script>
module.export = require('./live-request.js')
</script>