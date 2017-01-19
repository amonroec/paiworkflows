<script>
  import {mapState} from 'vuex'
  import TopMenu from './components/TopMenu'
  export default {
    components: {
      TopMenu
    },
    computed: {
      ...mapState({
        userStore: state => state.userStore
      })
    },
    created () {
      console.log('I was created')
      const userObj = JSON.parse(window.localStorage.getItem('authUser'))
      this.$store.dispatch('setUserObject', userObj)
    }
  }
</script>
<template>
<div id="body">
  <pre>{{ userStore }}</pre>
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
