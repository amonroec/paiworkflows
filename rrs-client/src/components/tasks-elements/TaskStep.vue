<template>
<div id="taskStep">
  <div v-if="taskStore.currentTask.status === 'assign'" id="assignTask">
    <h1>Needs Assigned!!!</h1>
    <!--
    <select v-if="workers.length > 0" v-model="selectedWorker">
      <option v-bind:value="'assignWorker'">Assign to Worker</option>
      <option v-for="worker in workers" v-bind:value="worker.id">
        {{ worker.name }}
      </option>
    </select>
    -->
    <input
      type="button"
      name="assign_task"
      v-on:click="assignTask"
      value="Assign Task"
    ></input>
  </div>
  <div v-if="taskStore.currentTask.status === 'upload'" id="submitForUpload">
    <h1>Needs Upload/Submit for Review</h1>
    <form method="POST" action="http://localhost:8000/api/uploadFile" enctype="multipart/form-data">
      <input type="hidden" name="task_id" :value="taskStore.currentTask.id"></input>
      <input
        type="file"
        name="file_upload"
        :value="fileUpload"
      >
      <input
        type="submit"
        name="submit"
        value="submit"
      >Submit</input>
    </form>
  </div>
  <div v-if="taskStore.currentTask.status === 'approve'" id="submitForApproval">
    <h1>This Art File Needs Your Approval.</h1>
    <input
      type="button"
      name="approve_art"
      v-on:click="approveArt"
      value="Approve!"
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
        <label for="reason">What is your reason for declining this art file?</label><br /><br />
        <textarea name="reason" id="declineReasonTextarea" v-model="message.text"></textarea>
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