<template>
<div id="displayForm">
  <info-bar :workflow.async="workflow" :taskStore.async="taskStore" :currentTask.async="currentTask"></info-bar>
  <work-space :taskStore.async="taskStore"></work-space>
  <activity-feed></activity-feed>
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>