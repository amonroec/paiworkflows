<template>
  <div id="allTasksPage">
    <table>
      <tr v-for="task in all_tasks">
        <a>
          <td>{{task.id}}</td>
          <td>{{task.workflow_id}}</td>
          <td>{{task.csr_assigned}}</td>
          <td>{{task.app_worker}}</td>
          <td>{{task.submitted_by}}</td>
          <td><a href="http://localhost:8000/assets/forms/task.form_image_url"></a></td>
        </a>
      </tr>
    </table>
  </div>
</template>
<script>
module.exports = require('./js/all-tasks-page.js')
</script>
