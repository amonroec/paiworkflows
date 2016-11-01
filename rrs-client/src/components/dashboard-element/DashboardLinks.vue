<script>
export default {

}
</script>
<template>
  <div id="link-box">
    <form v-on:submit.prevent="handleLoginFormSubmit()">
      <div class="link">
        <a
          class="form-control"
          v-model="tasks"
          name="tasks"
          href="javascript:void(0)"
          v-on:click="handleLinkButtonPressed(this.name)"
        >
          <div>
            <label>Tasks</label>
          </div>
        </a>
      </div>
      <div class="link">
        <a
          class="form-control"
          v-model="calendar"
          name="calendar"
          href="javascript:void(0)"
          v-on:click="handleLinkButtonPressed(this.name)"
        >
          <div>
            <label>Calendar</label>
          </div>
        </a>
      </div>
      <div class="link">
        <a
          class="form-control"
          v-model="teams"
          name="teams"
          href="javascript:void(0)"
          v-on:click="handleLinkButtonPressed(this.name)"
        >
          <div>
            <label>Team</label> 
          </div>
        </a>
      </div>
      <div class="link">
        <a
          class="form-control"
          v-model="workflows"
          name="workflows"
          href="javascript:void(0)"
          v-on:click="handleLinkButtonPressed(this.name)"
        >
          <div>
            <label>Workflows</label> 
          </div>
        </a>
      </div>
    </form>
  </div>
</template>
<style>
#link-box {
	width:100%;
	height: 500px;
	border-radius: 5px;
	background-color:#282828;
	margin-top:10px;
}
.link {
	width:100px;
	height:100px;
	border-radius: 5px;
	margin:30px;
	margin-top:100px;
	background-color:green;
	float:left;
	line-height: 100px;
}
.link a {
	width:100%;
	height:100%;
	text-decoration: none;
	color:white;
}
.link div:hover {
	position:relative;
	width:100%;
	height:100%;
	background-color:black;
	border-radius:5px;
}
.link div {
	position:relative;
	width:100%;
	height:100%;
}
</style>