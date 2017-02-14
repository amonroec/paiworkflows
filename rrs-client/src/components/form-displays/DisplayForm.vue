<template>
<div id="displayForm" v-if="!loading && alert === ''">
  <info-bar :stage.async="stage" :loading.async="loading" :currentWorkflow.async="workflowStore.currentWorkflow" :currentTask.async="currentTask"></info-bar>
  <work-space></work-space>
  <activity-feed></activity-feed>
</div>
<div class="isLoading" v-else-if="loading">
  <i class="fa fa-circle-o-notch fa-spin" style="font-size:50px;margin-left:45%;margin-top:30%;"></i>
</div>
<div class="alert" id="assigned" v-else-if="!loading && alert === 'assign'">
  <p>This has been assigned! Great Job</p>
</div>
<div class="alert" id="assigned" v-else-if="!loading && alert === 'approve-art'">
  <p>This task has been approved</p>
</div>
<div class="alert" id="assigned" v-else-if="!loading && alert === 'submit-for-approval'">
  <p>This task has been submitted for approval</p>
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>