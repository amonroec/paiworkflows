<template>
<div :class="activityToggle" id="displayForm">
  <info-bar :stage.async="stage" :loading.async="loading" :currentWorkflow.async="workflowStore.currentWorkflow" :currentTask.async="currentTask"></info-bar>
  <work-space></work-space>
  <activity-feed v-show="activityFeedShow"></activity-feed>
  <div v-show="activityFeedShow" class="minimize" type="button" id="activityFeedToggle" v-on:click="activityFeedToggle(false, 'activity-hide')">
    <i class="fa fa-arrow-down"><i>  Hide Feed
  </div>
  <div v-show="!activityFeedShow" class="minimize" type="button" id="activityFeedToggle" v-on:click="activityFeedToggle(true, 'activity-show')">
    <i class="fa fa-arrow-up"><i>  Show Feed
  </div>
</div>
</template>
<script>
module.exports = require('./display-form.js')
</script>