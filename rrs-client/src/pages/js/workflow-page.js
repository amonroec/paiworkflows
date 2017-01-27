import {getPeople, getGroups, submitWorkflow, submitWorkflowForm} from './../../config'
var methods = {}

methods.addNewStep = function () {
  this.workflows.push({
    step_name: '',
    task_type: '',
    needs_assigned: '',
    person_or_group: '',
    assigner: '',
    assigned_group: '',
    approval_type: '',
    choose_person: '',
    task_description: ''
  })
}

methods.pullPeople = function () {
  this.$http.post(getPeople)
    .then(response => {
      this.people = response.data
      this.getAdmins()
    })
}

methods.getAdmins = function () {
  var that = this
  this.people.forEach(function (person) {
    if (parseInt(person.access_level) === 1) {
      that.admins.push(person)
    }
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
          task_type: '',
          needs_assigned: '',
          person_or_group: '',
          assigner: '',
          assigned_group: '',
          approval_type: '',
          choose_person: '',
          task_description: ''
        }
      ],
      people: [],
      groups: [],
      admins: [],
      personOrGroup: [
        { text: 'Person Or Group?', value: '' },
        { text: 'Person', value: 'person' },
        { text: 'Group', value: 'group' }
      ],
      task_options: [
        { text: 'Select Task Type', value: '' },
        { text: 'Upload', value: 'upload' },
        { text: 'Inquire', value: 'inquire' },
        { text: 'Edit File', value: 'edit' },
        { text: 'Manual', value: 'manual' },
        { text: 'Need Assigned?', value: 'assign' },
        { text: 'Assign Group', value: 'assign_group' },
        { text: 'Approve', value: 'approve' },
        { text: 'Submit Form', value: 'submit' }
      ],
      approval_options: [
        { text: 'Requesting Person', value: 'person_who_submitted' },
        { text: 'Other Person', value: 'other_person' },
        { text: 'Any in Group', value: 'any_in_group' }
      ],
      form_select: '',
      form_options: [
        { text: 'Select Form', value: '' },
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
