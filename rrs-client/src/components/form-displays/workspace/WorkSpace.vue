<template>
  <div id="workspace">
    <h2>Artpack Number Request</h2>
    <table class="displayTable" border="1">
      <tbody>
        <tr>
          <td>Artpack Number: {{taskStore.currentForm.artpack_num ? taskStore.currentForm.artpack_num : '---'}}</td>
          <td>Customer Name: {{taskStore.currentForm.customer_name ? taskStore.currentForm.customer_name : '---'}}</td>
        </tr>
        <tr>
          <td>Account Name: {{taskStore.currentForm.account_name ? taskStore.currentForm.account_name : '---'}}</td>
          <td>Account Number: {{taskStore.currentForm.account_num ? taskStore.currentForm.account_num : '---'}}</td>
        </tr>
        <tr>
          <td>Date Entered: {{taskStore.currentForm.created_at ? taskStore.currentForm.created_at : '---'}}</td>
          <td>Turn Time: {{taskStore.currentForm.turn_time ? taskStore.currentForm.turn_time : '---'}}</td>
        </tr>
        <tr>
          <td># of Designs: {{taskStore.currentForm.num_designs ? taskStore.currentForm.num_designs : '---'}}</td>
          <td>Package Type: {{taskStore.currentForm.package_type ? taskStore.currentForm.package_type : '---'}}</td>
        </tr>
        <tr>
          <td>Package Type: {{taskStore.currentForm.package_type ? taskStore.currentForm.package_type : '---'}}</td>
          <td>Reference Tapes: {{taskStore.currentForm.reference_tapes ? taskStore.currentForm.reference_tapes : '---'}}</td>
        </tr>
        <tr>
          <td>Number of Designs: {{taskStore.currentForm.num_designs ? taskStore.currentForm.num_designs : '---'}}</td>
          <td>Manipulate the Logo?: {{taskStore.currentForm.manipulate_logo ? taskStore.currentForm.manipulate_logo : '---'}}</td>
        </tr>
        <tr>
          <td>Style Preference: {{taskStore.currentForm.style_preference ? taskStore.currentForm.style_preference : '---'}}</td>
          <td>Turn Time: {{taskStore.currentForm.turn_time ? taskStore.currentForm.turn_time : '---'}}</td>
        </tr>
        <tr>
          <td>Rep Name: {{taskStore.currentForm.rep_name ? taskStore.currentForm.rep_name : '---'}}</td>
          <td>Person Requesting: {{taskStore.currentForm.person_request ? taskStore.currentForm.person_request : '-'}}</td>
        </tr>
        <tr>
          <td>Description: {{taskStore.currentForm.description ? taskStore.currentForm.description : '---'}}</td>
          <td>Threads: {{taskStore.currentForm.threads ? taskStore.currentForm.threads : '---'}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
module.exports = require('./work-space.js')
</script>