<template>
  <div id="taskPage">
    <task-bar v-on:task_clicked="taskClicked"></task-bar>
    <display-form  v-if="!loading && alert === '' && taskStore.currentTask !== '' && taskStore.stage !== ''"></display-form>
    <div class="isLoading" v-else-if="loading && taskStore.currentTask !== ''">
      <i class="fa fa-spinner fa-pulse" style="font-size:50px;margin-left:45%;margin-top:30%;color:rgba(0,0,0,.5);"></i>
    </div>
    <div class="alert" id="assigned" v-else-if="alert === 'assign'">
      <p>Task assigned.. </p>
    </div>
    <div class="alert" id="assigned" v-else-if="alert === 'approve-art'">
      <p>Task approved.. </p>
    </div>
    <div class="alert" id="assigned" v-else-if="alert === 'decline-art'">
      <p>Task not approved.. </p>
    </div>
    <div class="alert" id="assigned" v-else-if="alert === 'submit-for-approval'">
      <p>Submitted for approval.. </p>
    </div>
    <div class="alert" id="assigned" v-else-if="alert === 'claim-task'">
      <p>Added to your queue.. </p>
    </div>
    <div id="homeDisplay">
      <div id="clickTask">Click on a task to expand</div>
      <img src="./../assets/images/click-arrow.png"></img>
    </div>
  </div>
</template>
<script>
module.exports = require('./js/home.js')
</script>
