<template>
  <div id="allTasksPage">
    <div class="filterDiv" v-show="!searchTable">
      <h2 style="margin-top: 2px;">Search Filter</h2>
      <div>
        <select v-model="selectFilter" id="firstSelect" v-on:change="clear()">
          <option v-for="option in selectOptions" v-bind:value="option.value">{{ option.text }}</option>
        </select>
      </div>
      <div v-if="selectFilter === 'all'">
        <select v-model="selectAllSearch">
          <option v-for="option in selectAllOptions" v-bind:value="option.value">{{ option.text }}</option>
        </select>
        <div id="searchBoxDiv">
          <input type="text" v-model="searchValue" placeholder="Search..." />
        </div>
      </div>
      <div v-if="selectFilter !== 'all'">
        <select v-model="selectForm">
          <option v-for="option in selectFormOptions" v-bind:value="option.value">{{ option.text }}</option>
        </select>
        <div id="searchBoxDiv">
          <input type="text" v-model="searchValue" placeholder="Search..." />
        </div>
      </div>
      <div class="action_button" id="searchButtonDiv" type="button" v-on:click="filterTasks()">Search
        <i class="fa fa-search"><i>
      </div>
      <div class="action_button" id="searchButtonDiv" style="width: 80px;margin-right: 10%;float:left;margin-top:-1px;background-color: grey;color:white;" type="button" v-on:click="clear()">Clear
        <i class="fa fa-times-circle"><i>
      </div>
    </div>
    <div v-show="searchTable">
      <div class="action_button" id="searchButtonDiv" style="margin-left: 40%;margin-top: 10px;" type="button" v-on:click="searchTableShow()">Search For New Request
        <i class="fa fa-search"><i>
      </div>
    </div>
    <div v-if="!searchTable" class="all_tasks_table">
      <table>
        <tr><th>Request ID</th><th>Form Type</th><th>Form Name</th><th>Form Number</th><th>Submitted By</th><th>Status</th><!-- <th>View</th> --></tr>
        <tr v-show="!loading" v-for="(task, index) in all_tasks" v-on:click="viewTask(task.task)">
            <td>{{task.task.id}}</td>
            <td>{{task.task.table_name}}</td>
            <td>{{task.task.form.artpack_name}}</td>
            <td>{{task.task.form_num}}</td>
            <td>{{task.task.submitted_by}}</td>
            <td>{{task.task.status === 'assign_group' ? 'claim' : task.task.status}}</td>
<!--
            <td><a :href="formDomain + task.form_image_url">View Form</a></td>

            <td v-on:click="viewTask(task.task)"><i class="fa fa-eye"></i></td> -->
        </tr>
      </table>
      <div class="isLoading" style="width:100%;height:100%;" v-show="loading">
        <i class="fa fa-spinner fa-pulse" style="font-size:50px;margin-left:45%;margin-top:30%;color:rgba(0,0,0,.5);"></i>
      </div>
      <div v-if="!searchNotFound" id="noSearch">No Request Found</div>
    </div>
    <div v-else id="searchPageDisplay">
      <div class="isLoading" style="width:100%;height:100%;" v-if="taskLoading && taskStore.currentTask !== ''">
        <i class="fa fa-spinner fa-pulse" style="font-size:50px;margin-left:45%;margin-top:30%;color:rgba(0,0,0,.5);"></i>
      </div>
      <display-form  v-else-if="!taskLoading && taskStore.stage !== ''"></display-form>
    </div>
  </div>
</template>
<script>
module.exports = require('./js/search-page.js')
</script>
