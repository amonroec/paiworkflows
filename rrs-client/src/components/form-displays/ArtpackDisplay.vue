<template>
<div id="artpackDisplayDiv">
  <div id="summaryBar">
    <assign-task :v-if="stage===1" :stage.sync="stage" :request_id.sync="id"></assign-task>
  </div>
  <div id="workspace">
    <h2>Artpack Request</h2>
    <table v-for="artpack in artpacks" class="displayTable" border="1">
      <tbody>
        <tr>
          <td>Artpack Number: {{artpack.artpack_num ? artpack.artpack_num : '---'}}</td>
          <td>Customer Name: {{artpack.customer_name ? artpack.customer_name : '---'}}</td>
        </tr>
        <tr>
          <td>Account Name: {{artpack.account_name ? artpack.account_name : '---'}}</td>
          <td>Account Number: {{artpack.account_num ? artpack.account_num : '---'}}</td>
        </tr>
        <tr>
          <td>Date Entered: {{artpack.created_at ? artpack.created_at : '---'}}</td>
          <td>Turn Time: {{artpack.turn_time ? artpack.turn_time : '---'}}</td>
        </tr>
        <tr>
          <td># of Designs: {{artpack.num_designs ? artpack.num_designs : '---'}}</td>
          <td>Package Type: {{artpack.package_type ? artpack.package_type : '---'}}</td>
        </tr>
        <tr>
          <td>Package Type: {{artpack.package_type ? artpack.package_type : '---'}}</td>
          <td>Reference Tapes: {{artpack.reference_tapes ? artpack.reference_tapes : '---'}}</td>
        </tr>
        <tr>
          <td>Number of Designs: {{artpack.num_designs ? artpack.num_designs : '---'}}</td>
          <td>Manipulate the Logo?: {{artpack.manipulate_logo ? artpack.manipulate_logo : '---'}}</td>
        </tr>
        <tr>
          <td>Style Preference: {{artpack.style_preference ? artpack.style_preference : '---'}}</td>
          <td>Turn Time: {{artpack.turn_time ? artpack.turn_time : '---'}}</td>
        </tr>
        <tr>
          <td>Rep Name: {{artpack.rep_name ? artpack.rep_name : '---'}}</td>
          <td>Person Requesting: {{artpack.person_request ? artpack.person_request : '-'}}</td>
        </tr>
        <tr>
          <td>Description: {{artpack.description ? artpack.description : '---'}}</td>
          <td>Threads: {{artpack.threads ? artpack.threads : '---'}}</td>
        </tr>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="activity-feed">
    <activity-feed :task_id.sync="task_id"></activity-feed>
  </div>
</div>
</template>
<script>
module.exports = require('./artpack-display.js')
</script>