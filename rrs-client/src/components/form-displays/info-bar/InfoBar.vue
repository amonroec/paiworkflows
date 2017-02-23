<template v-if="!loading">
  <div id="infoBar">
    <div id="infoLeft">
      <div class="part1">Artpack Request {{currentTask.form_num}}</div>
        <div id="stageBarHolder">
          <div class="nodeHolder" v-if="currentWorkflow" v-for="(step, index) in currentWorkflow">
            <div class="stageBox">
              <div class="stageOuter">
                <div class="stageActive fa fa-repeat fa-spin" v-if="stage === index"></div>
                <div class="stageComplete fa fa-check" v-else-if="stage > index"></div>
                <div class="stageNotComplete fa fa-times" v-else></div>
              </div>
            </div>
            <div class="stageText">{{step.step_name}}</div>
          </div>  
        <div class="connectingBar"></div>     
      </div>
    </div>
    <div id="infoMid">
      <div class="accountName">Acct: {{currentForm.account_num}}</div>
      <div class="turnTime">Turn Time: {{currentForm.turn_time}}</div>
      <div class="">CSR: {{currentTask.csr_assigned}}</div>
      <div class="">Timestamp: {{currentTask.created_at}}</div>
    </div>
    <div id="infoRight">
      <task-step v-on:task_submitted="changeInTask" ></task-step>
    </div>  
  </div>
</template>
<script>
module.exports = require('./info-bar.js')
</script>