import TaskStep from './../../tasks-elements/TaskStep'

module.exports = {
  data: function () {
    return {
      image_url: ''
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
      console.log('changing image url')
      this.image_url = 'http://localhost:8000/assets/forms/' + this.currentTask.form_image_url
    }
  }
}
