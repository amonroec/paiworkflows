<template>
  <div id="topMenuDiv" v-if="userStore.authUser !== null && userStore.authUser.access_token">
    <div class="button-div">
      <div class="subcat-link">
        <router-link :to="{ name: 'dashboard' }" append>Dashboard</router-link>
      </div>
      <div class="subcat-link" id="subcat-request">
        <a name="requestForm" id="requestForm">Workflows</a>
        <div class="subcat-div" id="request-dropdown">
          <a href="javascript:void(0)" v-for="workflow in workflows" v-on:click="workflowClick(workflow)">{{workflow.workflow_name}}</a>
        </div>
      </div>
      <div class="subcat-link">
        <div id="topImage"><img v-bind:src="userStore.authUser.picture"></img></div>
        <router-link id="routerLink" :to="{ name: 'profile' }" append><div>{{userStore.authUser.name}}</div></router-link>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = require('./top-menu.js')
</script>