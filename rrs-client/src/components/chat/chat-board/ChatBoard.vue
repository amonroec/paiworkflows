<template>
<div id="chatBoard">
  <chat-display :task_id.sync="taskId"></chat-display>
  <chat-enter :task_id.sync="taskId"></chat-enter>
</div>
</template>
<script>
module.exports = require('./chat-board.js')
</script>