<template>
<div id="taskStep">
  <div v-if="taskStore.currentTask.status === 'assign'" id="assignTask">
    <h1>Needs Assigned</h1>
    <select class="action_button" v-if="workers.length > 0" v-model="selectedWorker">
      <option v-bind:value="'assignWorker'">Choose...<i class="fa fa-random"></i></option>
      <option v-for="worker in workers" v-bind:value="worker.id">
        {{ worker.name }}
      </option>
    </select>
    <div class="action_button assignSelect" type="button" name="assign_task" v-on:click="assignTask">Assign
      <i class="fa fa-share"><i>
    </div>
  </div>
  <div v-if="taskStore.currentTask.status === 'upload'" id="submitForUpload">
    <h1>Upload for Review</h1>
    <form method="POST" action="http://localhost:8000/api/uploadFile" enctype="multipart/form-data">
      <input type="hidden" name="task" :value="task" />
      <input type="hidden" name="task_id" :value="taskStore.currentTask.id"></input>
      <input type="hidden" name="workflow_id" :value="taskStore.currentTask.workflow_id" />
      <input type="hidden" name="status" :value="taskStore.currentTask.status" />
      <input
        class="fileUpload"
        type="file"
        name="file_upload"
        :value="fileUpload"
      >
      <input
        type="button"
        name="uploadFile"
        value="Submit"
        v-on:click="submitMessage('upload-file', 'The artfile has been uploaded!')"
      />
      <input
        class="fileUpload"
        type="submit"
        id="submitUpload"
        name="submit"
        value="submit"
      ></input>
      <div class="action_button" type="button" name="upload" v-on:click="clickUpload()">Upload
        <i class="fa fa-cloud-upload"><i>
      </div>
    </form>
    <!--
    <form action="#">
      <div class="input-file-container">  
        <input class="input-file" id="my-file" type="file">
        <label tabindex="0" for="my-file" class="input-file-trigger">Select a file...</label>
      </div>
      <p class="file-return"></p>
    </form>
    -->
  </div>
  <div v-if="taskStore.currentTask.status === 'approve'" id="submitForApproval">
    <h1>Review Art</h1>
    <input
      type="button"
      name="approve_art"
      v-on:click="approveArt"
      value="Approve"
      v-show="declineArtValue === 0"
    ></input>
    <input
      type="button"
      name="decline_art"
      v-on:click="declineArtValue = 1"
      value="Decline"
      v-show="declineArtValue === 0"
    ></input>
    <div v-show="declineArtValue === 1" id="declineArtReason">
      <div>
        <textarea name="reason" id="declineReasonTextarea" v-model="message.text" placeholder="What is your reason for declining this art file?"></textarea>
      </div>
      <input
        type="button"
        v-on:click="submitDecline"
        value="Submit Decline"
      >
      <input
        type="button"
        v-on:click="declineArtValue = 0"
        value="Cancel"
      >
    </div>
  </div>
</div>
</template>
<script>
module.exports = require('./task-step.js')
</script>