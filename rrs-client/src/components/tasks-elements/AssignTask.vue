<template>
<div id="taskStage">
  <div v-if="stage==1" id="assignTask">
    <h1>Needs Assigned!!!</h1>
    <select v-model="selectedWorker">
      <option v-bind:value="'assignWorker'">Assign to Worker</option>
      <option v-for="worker in workers" v-bind:value="worker.id">
        {{ worker.name }}
      </option>
    </select>
    <input
      type="button"
      name="assign_task"
      v-on:click="assignTask"
      value="Assign Task"
    ></input>
  </div>
  <div v-if="stage==2" id="submitForApproval">
    <h1>Needs Upload/Submit for Review</h1>
    <input
      :v-model="fileUpload"
      type="file"
      name="fileUpload"
      value=""
    >
    <input
      type="button"
      name="assign_task"
      v-on:click="submitForApproval"
      value="Submit for Approval"
    ></input>
  </div>
</div>
</template>
<script>
module.exports = require('./assign-task.js')
</script>