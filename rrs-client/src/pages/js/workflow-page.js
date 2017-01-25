import {getPeople, getGroups, submitWorkflow, submitWorkflowForm} from './../../config'
var methods = {}

methods.addNewStep = function () {
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
}

methods.pullPeople = function () {
  this.$http.post(getPeople)
    .then(response => {
      this.people = response.data
    })
}

methods.pullGroups = function () {
  this.$http.post(getGroups)
    .then(response => {
      this.groups = response.data
    })
}

methods.submitForm = function () {
  var count = this.workflows.length
  console.log('count' + count)
  const workflowData = {
    workflow_name: this.workflow_name,
    form_name: this.form_select,
    stage_num: count
  }
  this.$http.post(submitWorkflowForm, workflowData)
    .then(response => {
      console.log(response)
      const postData = {
        workflow_name: response.data,
        workflow_array: this.workflows
      }
      this.$http.post(submitWorkflow, postData)
        .then(response => {
          console.log(response)
        })
    })
}

module.exports = {
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
  methods: methods,
  created: function () {
    this.pullPeople()
    this.pullGroups()
  }
}
