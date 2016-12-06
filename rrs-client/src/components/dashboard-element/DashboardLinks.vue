<script>
export default {

}
</script>
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
          to="/tasks"
        >
          <div>
	          <center>
	            <img src="../../assets/white100/Checklist Filled.png"></img> 
	          </center>
          	Tasks
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
    </form>
  </div>
</template>
<style>
#link-box {
	width:1160px;
	height: 500px;
	border-radius: 5px;
	margin-top:10px;
	padding-top:40px;
	padding-left:20px;
	padding-right:20px;
	background-color: #282828;
}
.link {
	position:relative;
	width:130px;
	height:150px;
	border-radius: 5px;
	margin-left:30px;
	margin-right:30px;
	margin-top:60px;
	margin-bottom:0px;
	float:left;
	overflow:none;
}
.link a {
	width:100%;
	height:100%;
	text-decoration: none;
	color:white;
}

.link div:hover {
	box-shadow: 1px 1px 4px 4px #6b6b6b;
	color:black;
}

.link div {
	position:relative;
	width:100%;
	height:100%;
	font-family:helvetica;
	font-weight: 200;
}

.link img {
	width:70%;
	margin-top:15px;
	margin-bottom:12px;
}
.profileBackground {
	background:linear-gradient(#5ba5ff, #0061d8);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(0,97,216,1),
   0 1em 2em -0.75em rgba(0,97,216,0.75),
   0 1em 3em -0.5em rgba(0,97,216,0.5),
   0 2em 3em -0.25em rgba(0,97,216,0.2);
}
.tasksBackground {
	background:linear-gradient(#35ff9a, #00994c);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(0,153,76,1),
   0 1em 2em -0.75em rgba(0,153,76,0.75),
   0 1em 3em -0.5em rgba(0,153,76,0.5),
   0 2em 3em -0.25em rgba(0,153,76,0.2);
}
.calendarBackgrond {
	background:linear-gradient(#fcbc5d ,#fc9802);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(252,152,2,1),
   0 1em 2em -0.75em rgba(252,152,2,0.75),
   0 1em 3em -0.5em rgba(252,152,2,0.5),
   0 2em 3em -0.25em rgba(252,152,2,0.2);
}
.groupBackground {
	background:linear-gradient(#fc4967 ,#d60023);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(214,0,35,1),
   0 1em 2em -0.75em rgba(214,0,35,0.75),
   0 1em 3em -0.5em rgba(214,0,35,0.5),
   0 2em 3em -0.25em rgba(214,0,35,0.2);
}
.workflowsBackground {
	background:linear-gradient(#b55bff, #7000cc);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(112,0,204,1),
   0 1em 2em -0.75em rgba(112,0,204,0.75),
   0 1em 3em -0.5em rgba(112,0,204,0.5),
   0 2em 3em -0.25em rgba(112,0,204,0.2);
}
.settingsBackground {
	background:linear-gradient(#48d3db ,#008a91);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(0,138,145,1),
   0 1em 2em -0.75em rgba(0,138,145,0.75),
   0 1em 3em -0.5em rgba(0,138,145,0.5),
   0 2em 3em -0.25em rgba(0,138,145,0.2);
}
.messagesBackground {
	background:linear-gradient(#ff56eb, #ba00a4);
	box-shadow:
   inset 0 7em 10em -5em rgba(255,255,255,0.6),
   0 0.3em 0.5em -0.2em rgba(186,0,164,1),
   0 1em 2em -0.75em rgba(186,0,164,0.75),
   0 1em 3em -0.5em rgba(186,0,164,0.5),
   0 2em 3em -0.25em rgba(186,0,164,0.2);
}
</style>