<template>
<div id="chatDisplay">
  <div class="messageHolder">
    <div class="message" v-for="message in currentTask">
      <div id="messageImage"><img :src="message.user_picture"></img></div>
      <div class="messageRight">
        <a class="messageName"> {{message.name}} </a>
        <a class="messageText"> {{message.text}} </a>
        <div class="messageTimestamp"> {{message.date}} </div>
      </div>
      <div class="messageTag">
        <a v-show="message.action == 'submit-form'" class="formSubmitted fa fa-arrow-right"></a>
        <a v-show="message.action == 'decline-art'" class="artDeclined fa fa-thumbs-o-down"></a>
        <a v-show="message.action == 'approve-art'" class="artApproved fa fa-thumbs-o-up"></a>
        <a v-show="message.action == 'upload-file'" class="fileUploaded fa fa-upload"></a>
        <a v-show="message.action == 'submit-for-approval'" class="fileRevised fa fa-edit"></a>
        <a v-show="message.action == 'message'" class="messageIcon fa fa-comment-o"></a>
        <a v-show="message.action == 'request-closed'" class="requestClosed fa fa-close"></a>
        <a v-show="message.action == 'assign'" class="assign fa fa-random"></a>
        <a v-show="message.action == 'claim-task'" class="claimTask fa fa-random"></a>
        <a v-show="message.action == 'unclaim-task'" class="unclaimTask fa fa-backward"></a>
      </div>
    </div>
  </div>
</div>
</template>
<script>
module.exports = require('./chat-display.js')
</script>