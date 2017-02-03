<template>
<div id="chatEnter">
  <label for="chat-textarea" value="Me:"></label>
	<textarea name="chat-textarea" id="chat-textarea" v-model="message.text"></textarea>
	<div class="submitChatButton" type="button" name="submitChat" v-on:click="submitChat">Send
	  <i class="fa fa-paper-plane" id="sendChat"><i>
	</div>  
</div>
</template>
<script>
module.exports = require('./chat-enter.js')
</script>