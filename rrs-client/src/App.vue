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
  <top-menu></top-menu>
  <div class="routerView">
    <router-view></router-view>
  </div>
</div>
</template>
<style>
html, body {
  width:100%;
  height:100%;
  margin: 0px;
  padding: 0px;
}
#body {
  margin:0px;
  padding:0px;
  float:left;
  background-color: #e0e0e0;
  width:100%;
  height:100%;
}
.routerView {
  float:left;
  position:absolute;
  left: 0px ;
  width: 100%;
  height:calc(100vh - 80px);
}
#taskBar {
  left: 0px;
  width: 240px;
  float:left;
}
</style>
