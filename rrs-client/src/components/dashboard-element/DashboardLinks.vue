<template>
  <div id="link-box">
    <form v-on:submit.prevent="handleLoginFormSubmit()">
      <div class="link profileBackground">
        <router-link
          class="form-control"
          name="profile"
          href="javascript:void(0)"
          to="/profile"
        >
        <div>
          <center>
            <img src="../../assets/white100/Circled User Male Filled.png"></img> 
          	Profile
          </center>
        </div>
        </router-link>
      </div>
      <div class="link tasksBackground">
        <router-link
          class="form-control"
          name="tasks"
          href="javascript:void(0)"
          to="/home"
        >
          <div>
	          <center>
	            <img src="../../assets/white100/Checklist Filled.png"></img> 
	          </center>
          	My Tasks
          </div>
        </router-link>
      </div>
      <div class="link tasksBackground">
        <router-link
          class="form-control"
          name="tasks"
          href="javascript:void(0)"
          to="/tasks/all"
        >
          <div>
            <center>
              <img src="../../assets/white100/Checklist Filled.png"></img> 
            </center>
            All Tasks
          </div>
        </router-link>
      </div>
      <div class="link calendarBackgrond">
        <router-link
          class="form-control"
          name="calendar"
          href="javascript:void(0)"
          to="/calendar"
        >
        <div>
          <center>
            <img src="../../assets/white100/Calendar Filled.png"></img> 
          </center>
          Calendar
        </div>
        </router-link>
      </div>
      <div class="link groupBackground">
        <router-link
          class="form-control"
          name="group"
          href="javascript:void(0)"
          to="/group"
        >
        <div>
          <center>
            <img src="../../assets/white100/User Groups Filled.png"></img> 
          </center>
          My Groups
        </div>
        </router-link>
      </div>
      <div class="link workflowsBackground">
        <router-link
          class="form-control"
          name="workflows"
          href="javascript:void(0)"
          to="/workflow"
        >
        <div>
          <center>
            <img src="../../assets/white100/Workflow Filled.png"></img> 
          </center>
          Workflows
        </div>
        </router-link>
      </div>
      <div class="link settingsBackground">
        <router-link
          class="form-control"
          name="settings"
          href="javascript:void(0)"
          to="/settings"
        >
        <div>
          <center>
            <img src="../../assets/white100/Settings 3 Filled.png"></img> 
          </center>
          Settings
        </div>
        </router-link>
      </div>
      <div class="link messagesBackground">
        <router-link
          class="form-control"
          name="messages"
          href="javascript:void(0)"
          to="/messages" 
        >
        <div>
          <center>
            <img src="../../assets/white100/Comments Filled.png"></img> 
          </center>
          Messages
        </div>
        </router-link>
      </div>
      <div class="link settingsBackground">
        <router-link
          class="form-control"
          name="needs_assigned"
          href="javascript:void(0)"
          to="/tasks"
        >
        <div>
          <center>
             
          </center>
          Needs Assigned
        </div>
        </router-link>
      </div>
    </form>
  </div>
</template>