<template>
  <div id="infoBar">
    <div id="infoLeft">
      <div class="part1">Artpack Request {{taskStore.currentForm.artpack_num}}</div>
        <div id="stageBarHolder">
          <div class="nodeHolder" v-for="(step, index) in workflowSteps">
            <div class="stageBox">
              <div class="stageOuter">
                <div class="stageActive fa fa-folder-open" v-if="currentTask.status == step.task_type"></div>
                <div class="stageComplete fa fa-check" v-else-if="stage+1 > index"></div>
                <div class="stageNotComplete fa fa-times" v-else></div>
              </div>
            </div>
            <div class="stageText">{{step.step_name}}</div>
          </div>  
        <div class="connectingBar"></div>     
      </div>
    </div>
    <div id="infoMid">
      <div class="accountName">Account: {{taskStore.currentForm.account_name}}</div>
      <div class="accontNum">Account #: {{taskStore.currentForm.account_num}}</div>
      <div class="turnTime">Turn Time: {{taskStore.currentForm.turn_time}}</div>
      <div class="">Submitted By: {{taskStore.currentForm.submitted_by}}</div>
      <div>Description: {{taskStore.currentForm.description}}</div>
    </div>
    <div id="infoRight">
      <task-step></task-step>
    </div>  
  </div>
</template>
<script>
module.exports = require('./info-bar.js')
</script>