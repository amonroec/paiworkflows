<template>
<div id="chatEnter">
  <label for="chat-textarea" value="Me:"></label>
    <textarea name="chat-textarea" id="chat-textarea" v-show="!loading" v-model="message.text"></textarea>
    <div class="submitChatButton" type="button" v-show="!loading" name="submitChat" v-on:click="submitChat">Send
      <i class="fa fa-paper-plane" id="sendChat"></i>
    </div>
    <div style="position:relative;width:100%;height:100%" v-show="loading">
      <i class="fa fa-spinner fa-pulse" style="font-size:50px;margin-left:45%;margin-top:5%;color:rgba(0,0,0,.5);"></i>
    </div>
</div>
</template>
<script>
module.exports = require('./chat-enter.js')
</script>