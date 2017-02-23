<template>
  <div class="task-bar">
    <h2>Current Tasks</h2>
    <div v-for="task in taskStore.tasks">
      <form class="taskform" v-on:submit.prevent="linkData">
        <div v-show="parseInt(task.app_worker) === parseInt(userStore.authUser.id) || task.app_group == userStore.groups" class="activeTask"></div>
        <div v-show="parseInt(task.app_worker) !== parseInt(userStore.authUser.id)" class="notActiveTask"></div>
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
            <table class="artpack-table">
              <tbody>
                <th colspan="2">Artpack Request</th>
                <tr>
                  <td>Artpack#:</td>
                  <td>{{ task.form_num }}</td>
                </tr>
                <tr>
                  <td>Turn Time:</td>
                  <td>{{ task.turn_time }}</td>
                </tr>
                <tr>
                  <td>Date Requested:</td>
                  <td>{{ task.created_at }}</td>
                </tr>
              </tbody>
            </table>
            <i v-show="task.status == 'upload'" class="upload fa fa-upload"></i>
            <i v-show="task.status == 'review'" class="review fa fa-search"></i>
            <i v-show="task.status == 'assign_group'" class="assign_group fa fa-plus-square"></i>
            <i v-show="task.status == 'assign'" class="assign fa fa-random"></i>
          </div>
        </a>
      </form>
    </div>
    <div v-show="taskStore.tasksLoading">
      <i class="fa fa-circle-o-notch fa-spin" style="font-size:50px;margin-left:45%;margin-top:10%;"></i>
    </div>
    <div v-show="taskStore.tasks === null">
      <h3>You have no tasks assigned</h3>
    </div>
  </div>
</template>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
module.exports = require('./task-bar.js')
</script>