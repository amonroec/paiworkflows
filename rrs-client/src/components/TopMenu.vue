<template>
  <div id="topMenuDiv" v-if="userStore.authUser !== null && userStore.authUser.access_token">
    <div class="button-div">

      <div class="menu-link">
        <img v-bind:src="userStore.authUser.picture"></img>
        <router-link id="routerLink" :to="{ name: 'profile' }" append>  {{userStore.authUser.name}}</router-link>
      </div>
      <div class="menu-link">
        <i class="fa fa-th-list"></i>
        <router-link :to="{ name: 'dashboard' }" append>  Tasks</router-link>
      </div>
      <div class="menu-link">
        <i class="fa fa-line-chart"></i>
        <router-link id="routerLink" :to="{ name: '' }" append>  Data</router-link>
      </div>
      <div class="menu-link">
        <i class="fa fa-users"></i>
        <router-link id="routerLink" :to="{ name: '' }" append>  Groups</router-link>
      </div>
      <div class="menu-link">
        <i class="fa fa-wrench"></i>
        <router-link id="routerLink" :to="{ name: '' }" append>  Admin</router-link>
      </div>
      <div class="menu-link" id="subcat-request">
        <i class="fa fa-file-text"></i>
        <a name="requestForm" id="requestForm">  Forms</a>
        <div class="subcat-div" id="request-dropdown">
          <a href="javascript:void(0)" v-for="workflow in workflows" v-on:click="workflowClick(workflow)">{{workflow.workflow_name}}</a>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
module.exports = require('./top-menu.js')
</script>