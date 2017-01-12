import ActivityFeed from './../ActivityFeed'
import AssignTask from './../tasks-elements/AssignTask'
var Active = require('./../../active.js')
var methods = {}

methods.getArtpack = function () {
  /*
  const postData = {
    order_id: this.order_id
  }
  this.$http.post(getArtpack, postData)
    .then(response => {
      if (response.status === 200) {
        this.artpacks = response.data
        console.log(this.artpacks)
      } else {
        console.log('noooooo')
      }
    })
  */
  this.artpacks = this.active_array[0]
  this.id = this.active_array[0][0].id
  this.task_id = this.active_array[1][2]
  this.table_name = this.active_array[1][0]
  this.stage = this.active_array[1][1]
  console.log('activearray')
  console.log(this.stage)
}

methods.getTask = function () {
  console.log(Active.methods.getTask())
}

module.exports = {
  name: 'artpack-display',
  data: function (done) {
    return {
      artpacks: [],
      table_name: '',
      stage: '',
      id: '',
      task_id: ''
    }
  },
  methods: methods,
  props: {
    active_array: {}
  },
  components: {
    ActivityFeed,
    AssignTask
  },
  watch: {
    active_array: function (val, oldVal) {
      this.getArtpack()
    }
  },
  created: function () {
    this.getArtpack()
    this.getTask()
  }
}
