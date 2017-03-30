<template>
  <div id="topMenuDiv" v-if="userStore.authUser !== null && userStore.authUser.access_token">
    <div class="button-div">

      <div class="menu-link">
        <img v-bind:src="userStore.authUser.picture"></img>
        <!--
        <router-link id="routerLink" :to="{ name: 'profile' }" append>  {{userStore.authUser.name}}</router-link>
        -->
        <a id="userName" style="text-decoration:none;color:#fff;">{{ userStore.authUser.name }}</a>
        <div class="subcat-div">
          <input type="button" value="Logout" v-on:click="logout()"></input>
        </div>
      </div>
      <div class="menu-link" v-on:click="goToHome()">
        <i class="fa fa-home"></i>
        <a> Home</a>
      </div>
      <div class="menu-link">
        <i class="fa fa-line-chart"></i>
        <router-link id="routerLink" :to="{ name: 'searchpage' }" append>  All Requests</router-link>
      </div>
<!--
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
-->
      <div class="menu-link" id="subcat-request">
        <i class="fa fa-file-text"></i>
        <a name="requestForm" id="requestForm" style="text-decoration:none;color:#fff;">  Forms</a>
        <div class="subcat-div" id="request-dropdown">
          <form method="POST" v-for="workflow in workflows" :action="domain + 'asi.php'">
            <input type="hidden" name="workflow_id" :value="workflow.id" />
            <input type="hidden" name="email" :value="userStore.authUser.email" />
            <input type="hidden" name="name" :value="userStore.authUser.name" />
            <input type="hidden" name="picture" :value="userStore.authUser.picture" />
            <input type="hidden" name="id" :value="userStore.authUser.id" />
            <input type="submit" :value="workflow.workflow_name"></input>
          </form>
        </div>
      </div>
      

    </div>
  </div>
</template>
<script>
module.exports = require('./top-menu.js')
</script>