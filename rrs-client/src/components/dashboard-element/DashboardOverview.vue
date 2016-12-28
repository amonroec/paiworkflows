<script>
import LiveOrders from './../tasks-elements/LiveOrders'
export default {
  components: {
    LiveOrders
  }
}
</script>
<template>
<div id="dashboardOverview">
<live-orders></live-orders>
</div>
</template>
<style>
#dashboardOverview {
  width:100%;
  height:100%;
}
#summaryBar {
  width:100%;
  height:160px;
  background-color:grey;
  float:left;
}
#workspace {
  width:70%;
  height:calc(100% - 160px);
  background-color:green;
  float:left;
}
.activity-feed {
  width:30%;
  height:calc(100% - 160px);
  float:left;
}
</style>