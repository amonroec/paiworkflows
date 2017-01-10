<template>
  <div id="topMenuDiv">
    <div class="button-div">
      <div class="subcat-link">
        <router-link :to="{ name: 'dashboard' }" append>Dashboard</router-link>
      </div>
      <div class="subcat-link" id="subcat-request">
        <a name="requestForm" id="requestForm">Request Forms</a>
        <div class="subcat-div" id="request-dropdown">
          <router-link :to="{ name: 'artpackForm' }" append>Artpack</router-link>
          <router-link :to="{ name: 'embroideryForm' }" append>Embroidery</router-link>
        </div>
      </div>
      <div class="subcat-link">
        <router-link :to="{ name: 'profile' }" append>{{name}}</router-link>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = require('./top-menu.js')
</script>