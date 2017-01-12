<template>
<div id="activityFeed">
  <chat-board :task_id.sync="taskId"></chat-board>
</div>
</template>
<script>
module.exports = require('./activity-feed.js')
</script>