import TaskStep from './../../tasks-elements/TaskStep'

module.exports = {
  data: function () {
    return {
      form_url: '',
      images: ''
    }
  },
  components: {
    TaskStep
  },
  props: [
    'currentTask'
  ],
  watch: {
    currentTask: function () {
      if (this.currentTask.upload_url !== '') {
        this.images = this.currentTask.upload_url
      }
    }
  }
}
