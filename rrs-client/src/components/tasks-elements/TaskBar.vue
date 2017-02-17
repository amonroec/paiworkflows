<template>
  <div class="task-bar">
    <h2>Current Tasks</h2>
    <div v-for="task in taskStore.tasks">
      <form class="taskform" v-on:submit.prevent="linkData">
        <div class="task-side"><div>
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
        <a class="task" v-if="task.table_name === 'artpack'"  href="javascript:void(0)" v-on:click="setCurrentTask(task)">
          <div>
            <table>
              <tbody>
                <tr>
                  <td>{{ task.id }}</td>
                  <td>{{ task.turn_time }}</td>
                  <td>{{ task.created_at }}</td>
                  <td>Art Pack Request</td>
                </tr>
              </tbody>
            </table>
          </div>
        </a>
      </form>
    </div>
    <div>
      <h3>You have no tasks assigned</h3>
    </div>
  </div>
</template>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
module.exports = require('./task-bar.js')
</script>