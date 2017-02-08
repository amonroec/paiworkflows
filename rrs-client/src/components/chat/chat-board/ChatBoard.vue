<template>
<div id="chatBoard">
  <h2>Activity Feed</h2>
  <div class="line"></div>
  <chat-display :task_id.sync="currentTask.id"></chat-display>
  <chat-enter :task_id.sync="currentTask.id"></chat-enter>
</div>
</template>
<script>
module.exports = require('./chat-board.js')
</script>