<template>
<div id="displayForm" v-show="taskStore.currentTask !== ''">
  <info-bar :workflow.async="workflow" :taskStore.async="taskStore" :currentTask.async="taskStore.currentTask"></info-bar>
  <work-space :currentTask.async="taskStore.currentTask"></work-space>
  <activity-feed></activity-feed>
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>