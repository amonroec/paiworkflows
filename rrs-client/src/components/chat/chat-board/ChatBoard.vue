<template>
<div id="chatBoard">
  <h2>Activity Feed</h2>
  <div class="line"></div>
  <chat-display></chat-display>
  <chat-enter></chat-enter>
</div>
</template>
<script>
module.exports = require('./chat-board.js')
</script>