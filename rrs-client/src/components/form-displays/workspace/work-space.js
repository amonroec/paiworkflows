import TaskStep from './../../tasks-elements/TaskStep'
import {apiDomain, uploadDomain, formDomain} from './../../../config'
import {mapState} from 'vuex'
var methods = {}

methods.downloadZip = function (image) {
  console.log(image)
  document.querySelector('#downloadZip').href = uploadDomain + image
  document.querySelector('#downloadZip').click()
/*
  const postData = {
    image: image
  }
  this.$http.post(downloadFile, postData)
    .then(response => {
      console.log(response)
    })
*/
}

module.exports = {
  data: function () {
    return {
      domain: apiDomain,
      uploadDomain: uploadDomain,
      formDomain: formDomain
    }
  },
  methods: methods,
  components: {
    TaskStep
  },
  computed: {
    ...mapState({
      chatStore: state => state.chatStore,
      currentTask: state => state.taskStore.currentTask,
      taskStore: state => state.taskStore
    })
  }
}
