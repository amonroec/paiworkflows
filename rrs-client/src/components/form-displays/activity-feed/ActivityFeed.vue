<template>
<div id="activityFeed">
  <div id="activityTop"></div>
  <div id="activityBottom"></div>
  <chat-board :task_id.sync="taskId"></chat-board>
</div>
</template>
<script>
module.exports = require('./activity-feed.js')
</script>