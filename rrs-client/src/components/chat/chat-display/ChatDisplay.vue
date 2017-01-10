<template>
<div id="chatDisplay">
  <div class="messageHolder">
    <div v-if="messages!==''"class="message" v-for="message in messages">
    	{{message.name}}: {{message.text}}
    </div>
  </div>
</div>
</template>
<script>
module.exports = require('./chat-display.js')
</script>