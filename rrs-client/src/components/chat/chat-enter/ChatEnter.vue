<template>
<div id="chatEnter">
  <label for="chat-textarea" value="Me:"></label>
	<textarea name="chat-textarea" id="chat-textarea" v-model="message.text"></textarea>
  <input
    type="button"
    name="submitChat"
    value="Submit Chat"
    v-on:click="submitChat"
  >
</div>
</template>
<script>
module.exports = require('./chat-enter.js')
</script>