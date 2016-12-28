<script>
	import LiveOrders from './../components/tasks-elements/LiveOrders'
export default {
  components: {
    LiveOrders
  }
}
</script>
<template>
<div id="dashboard-page">
  <live-orders></live-orders>
</div>
</template>
<style>
#dashboard-page {
	width:100%;
	height:calc(100% - 80px);
}
</style>