<template v-if="!loading">
  <div id="infoBar">
    <div id="infoLeft">
      <div class="part1">Artpack {{currentTask.form_num}}</div>
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
      <div v-show="parseInt(userStore.authUser.admin) === 1" class="action_button" id="unclaimTask" type="button" name="upload" v-on:click="unclaimTask()">Unclaim Task 
        <i class="fa fa-backward"><i>
      </div>
    </div>
    <div id="infoMid">
      <div class="accountName">Claimed By: {{claimer === null ? ' ' : claimer.name}}</div>
      <div class="turnTime">Turn Time: {{currentTask.turn_time}}</div>
      <div class="">Submitted By: {{currentTask.submitted_by}}</div>
      <div class="">Timestamp: {{currentTask.created_at }}</div>
    </div>
    <div id="infoRight">
      <task-step v-on:task_submitted="changeInTask" ></task-step>
    </div>  
  </div>
</template>
<script>
module.exports = require('./info-bar.js')
</script>