<script>
  import {mapState} from 'vuex'
  import {tasksUrl, getWorkflows, getHeader} from './config.js'
  import TopMenu from './components/TopMenu'
  import store from './store.js'
  export default {
    components: {
      TopMenu
    },
    store,
    methods: {
      getTasks () {
        const postData = {
          userId: this.userStore.authUser.id
        }
        console.log(postData)
        this.$http.post(tasksUrl, {headers: getHeader(), postData})
          .then(response => {
            if (response.status === 200) {
              this.$store.dispatch('setTasksArray', response.data)
              console.log(response)
            }
          })
      },
      getWorkflows () {
        this.$http.post(getWorkflows)
          .then(response => {
            var workflows = response.data
            this.$store.dispatch('setWorkflows', workflows)
          })
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
        this.$store.dispatch('setUserObject', userObj)
        this.getTasks()
        this.getWorkflows()
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
