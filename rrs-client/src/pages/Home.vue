<template>
  <div id="taskPage">
    <task-bar></task-bar>
    <display-form v-show="display === 'task'"></display-form>
    <div id="homeDisplay">
      <div id="clickTask">Click on the bar if you want to view the request!</div>
    </div>
  </div>
</template>
<script>
module.exports = require('./js/home.js')
</script>
