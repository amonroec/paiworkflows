<template>
  <div class="task-bar">
    <h2 style="margin-bottom:20px;">Current Tasks</h2>
    <div :v-if="!tasksLoading && finalTasks !== null" v-for="task in finalTasks">
<!--
      <form class="taskform" data-id="task.id" v-on:submit.prevent="linkData">
        <div v-if="parseInt(task.app_worker) === parseInt(userStore.authUser.id) || task.app_group == 'ASI Artpack'" class="activeTask"></div>
        <div v-else class="notActiveTask"></div>
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
            <i class="fa fa-exclamation-circle" style="position:absolute;right:-5px;top:-5px;z-index:600;color:red;font-size:25px;" v-show="notifications.includes(parseInt(task.id))"></i>
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
                  <td>Total Designs:</td>
                  <td>{{ task.total_designs }}</td>
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
-->
      <single-task v-on:task_changed="taskChanged" v-show="task.task.status !== 'closed'" :pusher.async="pusher" :groupCheck.async="groupCheck" :task.async="task.task" :notification.async="task.notify"></single-task>
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