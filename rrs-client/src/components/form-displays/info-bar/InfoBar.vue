<template>
  <div id="infoBar">
    <div id="taskInfo">
      <div>Artpack Num: {{taskStore.currentForm.artpack_num}}</div>
      <div>Account Name: {{taskStore.currentForm.account_name}}</div>
      <div>Account Num: {{taskStore.currentForm.account_num}}</div>
      <div>Turn Time: {{taskStore.currentForm.turn_time}}</div>
      <div>Submitted By: {{taskStore.currentForm.submitted_by}}</div>
      <div>Description: {{taskStore.currentForm.description}}</div>
    </div>
    <div id="stageBarHolder">
      <h1>Stage of Task</h1>
      <div class="stageBar" v-for="(step, index) in workflowSteps">
        <div class="stageComplete" v-if="taskStore.currentTask.stage > index">{{step.step_name}}</div>
        <div class="stageActive" v-else-if="taskStore.currentTask.stage == index">{{step.step_name}}</div>
        <div class="stageNotComplete" v-else>{{step.step_name}}</div>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = require('./info-bar.js')
</script>