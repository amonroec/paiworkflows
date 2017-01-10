<template>
<div id="chatBoard">
  <div id="chatDisplayDiv">
    <chat-display></chat-display>
  </div>
  <div id="chatEnterDiv">
    <chat-enter :task_id.sync="taskId"></chat-enter>
  </div>
</div>
</template>
<script>
module.exports = require('./chat-board.js')
</script>