<template>
<div id="displayForm" v-if="!loading">
  <info-bar :workflow.async="workflowStore.currentWorkflow" :taskStore.async="taskStore" :currentTask.async="taskStore.currentTask"></info-bar>
  <work-space></work-space>
  <activity-feed></activity-feed>
</div>
<div class="isLoading" v-else-if="loading">
<<<<<<< HEAD
  <i class="fa fa-spinner fa-spin" style="font-size:50px;margin-left:45%;margin-top:20%;"></i>
=======
  <i class="fa fa-spinner fa-spin" style="font-size:50px;margin-left:45%;margin-top:30%;"></i>
>>>>>>> origin/master
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>