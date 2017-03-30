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
        this.$store.dispatch('setTasksLoading', true)
        const postData = {
          user: this.userStore.authUser,
          user_groups: this.userStore.groups
        }
        this.$store.dispatch('setTasksArray', postData)
      },
      getWorkflows () {
        this.$store.dispatch('setWorkflows')
      },
      clearStorage () {
        window.localStorage.removeItem('authUser')
        window.localStorage.removeItem('currentTask')
        window.localStorage.removeItem('currentWorkflow')
      },
      setSession () {
        console.log('setting session')
        if (window.sessionStorage.getItem('SessionName')) {
          console.log('its set')
        } else {
          console.log('it needs set')
          this.$router.push({name: 'login'})
        }
      }
    },
    computed: {
      ...mapState({
        userStore: state => state.userStore,
        workflowStore: state => state.workflowStore,
        taskStore: state => state.taskStore
      })
    },
    watch: {
      'userStore.authUser': function () {
        if (this.userStore.authUser !== null) {
          this.getTasks()
          this.getWorkflows()
        }
      }
    },
    created () {
      const userObj = JSON.parse(window.localStorage.getItem('authUser'))
      var that = this
      if (!userObj) {
        this.$router.push({name: 'login'})
      } else {
        this.$store.dispatch('isLoading', true)
        this.$store.dispatch('setUserObject', userObj).then(response => {
          if (response === 'user_set') {
            that.$emit('user-set')
          }
        })
        this.$on('user-set', function () {
          that.getTasks()
          that.getWorkflows()
        })
      }
      // window.addEventListener('onload', this.setSession())
    }
  }
</script>
<template>
<div id="body">
  <div id="topMenu">
    <top-menu v-if="userStore.authUser !== null"></top-menu>
  </div>
  <div class="routerView">
    <router-view></router-view>
  </div>
</div>
</template>
<style lang="sass">
  @import './assets/app.css'
</style>
