import {artpackUrl, uploadFile, getWholeWorkflow} from './../../config'
var Active = require('./../../active.js')
var methods = {}

methods.handleSubmitForm = function () {
  const postData = {
    artpack_num: this.form_submit.artpack_num,
    rep_name: this.form_submit.rep_name,
    turn_time: this.form_submit.turn_time,
    account_name: this.form_submit.account_name,
    account_num: this.form_submit.account_num,
    customer_name: this.form_submit.customer_name,
    reference_tapes: this.form_submit.reference_tapes,
    package_type: this.form_submit.package_type,
    style_preference: this.form_submit.style_preference,
    location_course: this.form_submit.location_course,
    csr_name: this.form_submit.csr_name,
    manipulate: this.selected,
    design_num: this.form_submit.design_num,
    description_box: this.form_submit.description_box,
    threads: this.form_submit.threads
  }
  this.$http.post(artpackUrl, postData)
    .then(response => {
      if (response.status === 200) {
        const postData2 = {
          image: this.image
        }
        this.$http.post(uploadFile, postData2)
          .then(response => {
            console.log(response)
            if (response.status === 200) {
              this.$router.push({name: 'dashboard'})
            }
          })
      }
    })
}

methods.pullWorkflow = function () {
  const postData = {
    workflow_id: this.workflowId
  }
  this.$http.post(getWholeWorkflow, postData)
    .then(response => {
      this.workflow = response.data
      console.log(this.workflow[0])
    })
}

methods.onFileChange = function (e) {
  var files = e.target.files || e.dataTransfer.files
  if (!files.length) {
    return
  }
  this.image = files[0]
}

methods.getWorkflowId = function () {
  this.workflowId = Active.methods.getWorkflowId()
}

module.exports = {
  data: function () {
    return {
      selected: 'nike',
      options: [
        { text: 'Yes', value: 'yes' },
        { text: 'No', value: 'no' }
      ],
      form_submit: {
        artpack_num: '',
        rep_name: '',
        turn_time: '',
        account_name: '',
        account_num: '',
        customer_name: '',
        reference_tapes: '',
        package_type: '',
        style_preference: '',
        location_course: '',
        csr_name: '',
        manipulate: '',
        design_num: '',
        description_box: '',
        threads: ''
      },
      image: '',
      workflowId: '',
      workflow: []
    }
  },
  methods: methods,
  created: function () {
    this.getWorkflowId()
  }
}
