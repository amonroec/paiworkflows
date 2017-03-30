<template>
<div>
  <div style="width:100%;height:100%;" v-if="taskLoading">
    <i class="fa fa-spinner fa-pulse" style="font-size:35px;margin-left:45%;margin-top:10%;color:green;"></i>
  </div>
  <div v-else-if="!taskLoading" id="taskStep" >
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
    <div v-else-if="taskStore.currentTask.status === 'upload'" id="submitForUpload">
      <h1>Upload for Review</h1>
      <form method="POST" :action="domain + 'api/uploadFile'" enctype="multipart/form-data">
        <input type="hidden" name="form_num" :value="taskStore.currentTask.form_num" />
        <input type="hidden" name="task_id" :value="taskStore.currentTask.id"></input>
        <input type="hidden" name="workflow_id" :value="taskStore.currentTask.workflow_id" />
        <input type="hidden" name="status" :value="taskStore.currentTask.status" />
        <input
          class="fileUpload"
          type="file"
          name="file_upload"
          multiple
          :value="fileUpload"
          v-on:change="fileInputLoaded"
        >
        <div id="uploadButtonsDiv">
          <input
            class="fileUpload"
            type="submit"
            id="submitUploadForm"
            name="submit"
            value="submit"
          ></input>
          <input
            type="button"
            name="uploadFile"
            class="action_button"
            v-on:click="uploadFile()"
            id="uploadButton"
            value="Upload"
            disabled
          ></input>
          <div class="action_button" id="chooseFile" type="button" name="submitForApproval" v-on:click="clickUpload()">Choose File 
            <i class="fa fa-folder"></i>
          </div>
        </div>
        <div v-show="taskStore.currentTask.upload_url !== null" class="action_button" id="submitApproval" type="button" name="upload" v-on:click="submitForApproval()">Submit For Approval 
          <i class="fa fa-paper-plane"><i>
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
    <div v-else-if="taskStore.currentTask.status === 'review'" id="submitForApproval">
      <h1>Review Art</h1>
      <div 
        class="action_button artApproved"
        type="button"
        name="approve_art"
        v-on:click="submitReview('approve-art')"
        v-show="declineArtValue === 0">Approve
        <i class="fa fa-thumbs-up"></i></div>
      <div
        class="action_button artDeclined"
        type="button"
        name="decline_art"
        v-on:click="declineArtValue = 1"
        v-show="declineArtValue === 0">Decline
        <i class="fa fa-thumbs-down"></i></div>
      <div v-show="declineArtValue === 1" id="declineArtReason">
        <div>
          <textarea name="reason" id="declineReasonTextarea" v-model="declineText" placeholder="What is your reason for declining this art file?"></textarea>
        </div>
        <input
          type="button"
          v-on:click="submitReview('decline-art')"
          value="Submit Decline"
        >
        <input
          type="button"
          v-on:click="declineArtValue = 0"
          value="Cancel"
        >
      </div>
    </div>
    <div v-else-if="taskStore.currentTask.status === 'assign_group' && userStore.authUser.admin !== '2'" id="claimDiv">
      <h1>This task is waiting to be claimed</h1>
      <div :v-show="userStore.groups === 'ASI Artpack'" class="action_button" id="claimTask" type="button" v-on:click="claimTask()">Add To My Queue 
        <i class="fa fa-plus-square"></i>
      </div>
    </div>
  </div>
  <div style="width:100%;height:100%;" v-else="!taskLoading">
    <h1 style="color:#91a56f;">Waiting for an action from the assigned worker..</h1>
  </div>
</div>
</template>
<script>
module.exports = require('./task-step.js')
</script>