<template>
  <div id="taskPage">
    <task-bar v-on:task_clicked="taskClicked"></task-bar>
    <display-form  :v-if="!loading && display === 'task'"></display-form>
    <div id="homeDisplay">
      <div id="clickTask">Click on the bar if you want to view the request!</div>
    </div>
  </div>
</template>
<script>
module.exports = require('./js/home.js')
</script>
