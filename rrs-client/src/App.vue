<script>
  import TopMenu from './components/TopMenu'
  export default {
    components: {
      TopMenu
    },
    created () {
      console.log('I was created')
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
