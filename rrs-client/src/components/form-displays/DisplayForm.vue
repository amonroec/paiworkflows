<template>
<div id="displayForm">
  <info-bar :workflow.async="workflow"></info-bar>
  <work-space></work-space>
  <activity-feed></activity-feed>
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>