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
<div>
  <top-menu></top-menu>
  <center>
  <router-view></router-view>
  </center>
</div>
</template>
<style>
body {
  margin:0px;
  padding:0px;
  background-color: #e0e0e0;
}
</style>
