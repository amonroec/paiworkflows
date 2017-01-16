<template>
<div id="chatBoard">
  <center class="headers">Activity Feed</center>
  <div class="line"></div>
  <chat-display :task_id.sync="taskId"></chat-display>
  <chat-enter :task_id.sync="taskId"></chat-enter>
</div>
</template>
<script>
module.exports = require('./chat-board.js')
</script>