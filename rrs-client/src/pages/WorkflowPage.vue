<template>
<div id="workflowDiv">
  <form class="workflow-form" v-on:submit.prevent="submitForm">
    <center>
    <input
      class="workflow-name"
      type="text"
      name="workflow_name"
      :value="workflow_name"
      v-model="workflow_name"
      placeholder="Workflow Name"
    >
    <select v-model="form_select">
      <option v-for="option in form_options" v-bind:value="option.value">{{ option.text }}</option>
    </select>
    </center>
    <div v-for="workflow in workflows">
      <div class="workflow-holder">
        <div class="workflow-bar">
          <input
            type="text"
            name="step_name"
            placeholder="Enter Step Name"
            :value="workflow.step_name"
            v-model="workflow.step_name"
          >
          <input
            type="checkbox"
            name="needs_assigned"
            :value="workflow.needs_assigned"
            v-model="workflow.needs_assigned"
          >
          <select v-model="workflow.assigned_group">
            <option v-bind:value="'select'">Select Group</option>
            <option v-for="option in groups" v-bind:value="option.id">
              {{ option.group_name }}
            </option>
          </select>
          <select v-model="workflow.approval_type">
            <option v-bind:value="'select'">Select Approval</option>
            <option v-for="option in approval_options" v-bind:value="option.value">
              {{ option.text }}
            </option>
          </select>
          <select v-show="workflow.approval_type==='person'" v-model="workflow.choose_person">
            <option v-bind:value="'select'">Select Person</option>
            <option v-for="option in people" v-bind:value="option.id">
              {{ option.name }}
            </option>
          </select>
          <input
            type="text"
            name="assigner"
            placeholder="Assigner"
            :value="workflow.assigner"
            v-model="workflow.assigner"
          >
          <select v-model="workflow.task_type">
            <option v-for="option in task_options" v-bind:value="option.value">
              {{ option.text }}
            </option>
          </select>
          <textarea v-model="workflow.task_description"></textarea>
        </div>
        <button
          name="newStep"
          v-on:click.prevent="addNewStep"
          value="Add Step"
        >Add New</button>
      </div>
    </div>
    <input
      type="submit"
      name="submit"
      value="Submit"
    >
  </form>
</div>
</template>
<script>
module.exports = require('./js/workflow-page.js')
</script>