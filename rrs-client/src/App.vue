<script>
  import {mapState} from 'vuex'
  import {tasksUrl} from './config.js'
  import TopMenu from './components/TopMenu'
  export default {
    components: {
      TopMenu
    },
    methods: {
      getTasks () {
        const postData = {
          userId: this.userStore.authUser.id
        }
        console.log(postData)
        this.$http.post(tasksUrl, postData)
          .then(response => {
            if (response.status === 200) {
              this.$store.dispatch('setTasksArray', response.data)
            }
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
      this.$store.dispatch('setUserObject', userObj)
      this.getTasks()
      console.log('I was created')
    }
  }
</script>
<template>
<div id="body">
  <pre>{{ taskStore }}</pre>
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
