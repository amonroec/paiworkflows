<script>
  import {mapState} from 'vuex'
  import TopMenu from './components/TopMenu'
  import store from './store.js'
  export default {
    components: {
      TopMenu
    },
    store,
    methods: {
      getTasks () {
        this.$store.dispatch('setTasksArray', this.userStore.authUser.id)
      },
      getWorkflows () {
        this.$store.dispatch('setWorkflows')
      }
    },
    computed: {
      ...mapState({
        userStore: state => state.userStore,
        workflowStore: state => state.workflowStore,
        taskStore: state => state.taskStore
      })
    },
    created () {
      const userObj = JSON.parse(window.localStorage.getItem('authUser'))
      if (userObj !== null) {
        var loadUser = this.$store.dispatch('setUserObject', userObj)
        var that = this
        loadUser.then(function () {
          that.$store.dispatch('isLoading', true)
          that.getTasks()
          that.getWorkflows()
        })
      }
    }
  }
</script>
<template>
<div id="body">
  <div id="topMenu">
    <top-menu></top-menu>
  </div>
  <div class="routerView">
    <router-view></router-view>
  </div>
</div>
</template>
<style lang="sass">
  @import './assets/app.css'
</style>
