<template>
<div id="displayForm" v-if="!loading">
  <info-bar :workflow.async="workflowStore.currentWorkflow" :taskStore.async="taskStore" :currentTask.async="taskStore.currentTask"></info-bar>
  <work-space :currentTask.async="taskStore.currentTask"></work-space>
  <activity-feed></activity-feed>
</div>
<div style="width:500px;height:200px;background-color:green;" v-else-if="loading"></div>
</template>
<script>
module.exports = require('./display-form.js')
</script>