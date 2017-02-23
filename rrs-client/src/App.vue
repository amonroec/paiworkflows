<script>
  import {mapState} from 'vuex'
  import TopMenu from './components/TopMenu'
  import store from './store.js'
  import Pusher from 'pusher-js'
  export default {
    components: {
      TopMenu
    },
    store,
    methods: {
      getTasks () {
        const postData = {
          user_id: this.userStore.authUser.id,
          user_groups: this.userStore.groups
        }
        this.$store.dispatch('setTasksArray', postData)
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
      var that = this
      if (!userObj) {
        this.$router.push({name: 'login'})
      } else {
        this.$store.dispatch('isLoading', true)
        this.$store.dispatch('setUserObject', userObj).then(function () {
          that.$emit('user-set')
        })
        this.$on('user-set', function () {
          that.getTasks()
          that.getWorkflows()
        })
      }
      this.pusher = new Pusher('9ca3eda463882645ca10', {
        encrypted: true,
        cluster: 'mt1'
      })
      this.channel = this.pusher.subscribe('task_channel')
      this.channel.bind('task_change', function (data) {
        that.$emit('task_has_changed', data)
      })
      this.$on('task_has_changed', function (data) {
        console.log('task has changed', data)
      })
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
