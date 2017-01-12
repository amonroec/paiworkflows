<template>
<div id="chatDisplay">
  <div class="messageHolder">
    <div v-if="messages!==''" class="message" v-for="message in messages">
    	<div class="messageLeft"></div>
    	<div class="messageRight">
    		<a class="messageName"> {{message.name}} </a>
    		<a class="messageText"> {{message.text}} </a>
    		<a class="messageTimestamp"> Wednesday - January 12, 2017 - 00:00:00 </a>
    	</div>
    	<div class="line"></div>
    </div>
  </div>
</div>
</template>
<script>
module.exports = require('./chat-display.js')
</script>