<template>
<div id="activityFeed">
<div id="chatBoardDiv">
  <chat-board :task_id.sync="taskId"></chat-board>
</div>
</div>
</template>
<script>
module.exports = require('./activity-feed.js')
</script>