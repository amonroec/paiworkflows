<template>
<div id="artpackDisplayDiv">
  <div id="summaryBar">
    <table v-for="artpack in artpacks" id="displayTable" border="1">
      <tbody>
        <tr>
          <td>Account Name: {{artpack.account_name}}</td>
          <td>Account Number: {{artpack.account_num}}</td>
        </tr>
        
        <tr>
          <td>Artpack Number: {{artpack.artpack_num}}</td>
          <td>Customer Name: {{artpack.customer_name}}</td>
        </tr>
        <tr>
          <td># of Designs: {{artpack.num_designs}}</td>
          <td>Package Type: {{artpack.package_type}}</td>
        </tr>
        <tr>
          <td>Rep Name: {{artpack.rep_name}}</td>
          <td>Turn Time: {{artpack.turn_time}}</td>
        </tr>
        <tr>
          <td>Description: {{artpack.description}}</td>
          <td>Threads: {{artpack.threads}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div id="workspace">
    <assign-task :v-if="stage===1" :order_id.sync="id"></assign-task>
  </div>
  <div class="activity-feed">
    <activity-feed></activity-feed>
  </div>
</div>
</template>
<script>
module.exports = require('./artpack-display.js')
</script>