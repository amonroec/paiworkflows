<template>
<div id="chatDisplay">
  <div class="messageHolder">
    <div class="message" v-for="message in taskStore.currentChat">
    	<div class="messageLeft"></div>
    	<div class="messageRight">
    		<a class="messageName"> {{message.name}} </a>
    		<a class="messageText"> {{message.text}} </a>
    		<a class="messageTimestamp"> {{message.date}} </a>
    	</div>
    	<div class="line"></div>
    </div>
  </div>
</div>
</template>
<script>
module.exports = require('./chat-display.js')
</script>