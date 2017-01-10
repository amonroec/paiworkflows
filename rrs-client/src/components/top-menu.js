var methods = {}

methods.getUser = function () {
  this.name = window.sessionStorage.getItem('userName')
}

module.exports = {
  name: 'liveOrders',
  data: function () {
    return {
      name: ''
    }
  },
  methods: methods,
  created: function () {
    this.getUser()
  }
}
