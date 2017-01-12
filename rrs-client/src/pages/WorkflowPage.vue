<script>
import {getPeople, getGroups, submitWorkflow, submitWorkflowForm} from './../config'
export default {
  data: function () {
    return {
      workflow_name: '',
      workflows: [
        {
          step_name: '',
          task_type: 'SelectTaskType',
          needs_assigned: '',
          assigner: '',
          assigned_group: 'select',
          approval_type: 'select',
          choose_person: 'select',
          task_description: ''
        }
      ],
      people: [],
      groups: [],
      task_options: [
        { text: 'Select Task Type', value: 'SelectTaskType' },
        { text: 'Upload', value: 'upload' },
        { text: 'Inquire', value: 'inquire' },
        { text: 'Edit File', value: 'edit' },
        { text: 'Manual', value: 'manual' }
      ],
      approval_options: [
        { text: 'None', value: 'None' },
        { text: 'Requesting Person', value: 'csr' },
        { text: 'Other Person', value: 'person' },
        { text: 'Any in Group', value: 'group' }
      ],
      form_select: 'select',
      form_options: [
        { text: 'Select Form', value: 'select' },
        { text: 'Artpack Form', value: 'artpack' },
        { text: 'Embroidery Form', value: 'embroidery' }
      ]
    }
  },
  methods: {
    addNewStep: function () {
      this.workflows.push({
        step_name: '',
        task_type: 'SelectTaskType',
        needs_assigned: '',
        assigner: '',
        assigned_group: 'select',
        approval_type: 'select',
        choose_person: 'select',
        task_description: ''
      })
    },
    pullPeople: function () {
      this.$http.post(getPeople)
        .then(response => {
          this.people = response.data
        })
    },
    pullGroups: function () {
      this.$http.post(getGroups)
        .then(response => {
          this.groups = response.data
        })
    },
    submitForm: function () {
      const postData = {
        workflow_name: this.workflow_name,
        workflow_array: this.workflows
        /*
        step_name: this.workflows.step_name,
        task_type: this.workflows.task_type,
        needs_assigned: this.workflows.needs_assigned,
        assigner: this.workflows.assigner,
        assigned_group: this.workflows.assigned_group,
        approval_type: this.workflows.approval_type,
        choose_person: this.workflows.choose_person,
        task_description: this.workflows.task_description
        */
      }
      const workflowData = {
        workflow_name: this.workflow_name,
        form_name: this.form_select
      }
      console.log(postData)
      this.$http.post(submitWorkflow, postData)
        .then(response => {
          this.$http.post(submitWorkflowForm, workflowData)
            .then(response => {
              console.log(response)
            })
        })
    }
  },
  created: function () {
    this.pullPeople()
    this.pullGroups()
  }
}
</script>
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
          v-on:click="addNewStep"
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