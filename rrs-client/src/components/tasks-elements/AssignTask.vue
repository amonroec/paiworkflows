<template>
<div id="assignTask">
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
</template>
<script>
module.exports = require('./assign-task.js')
</script>