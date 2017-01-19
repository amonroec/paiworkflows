import {artpackUrl} from './../../config'
import {mapState} from 'vuex'
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
    submitted_by: this.userStore.authUser.id,
    manipulate: this.selected,
    design_num: this.form_submit.design_num,
    description_box: this.form_submit.description_box,
    threads: this.form_submit.threads,
    workflow_id: this.workflowStore.currentWorkflow.id
  }
  this.$http.post(artpackUrl, postData)
    .then(response => {
      if (response.status === 200) {
        console.log(response)
      }
    })
}

methods.onFileChange = function (e) {
  var files = e.target.files || e.dataTransfer.files
  if (!files.length) {
    return
  }
  this.image = files[0]
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
        submitted_by: '',
        manipulate: '',
        design_num: '',
        description_box: '',
        threads: ''
      },
      image: '',
      task: {
        app_worker: '',
        stage: ''
      }
    }
  },
  methods: methods,
  computed: {
    ...mapState({
      userStore: state => state.userStore,
      workflowStore: state => state.workflowStore
    })
  },
  created: function () {
    console.log(this.userStore)
  }
}
