<script>
  import DashboardOverview from './../components/dashboard-element/DashboardOverview'
  import DashboardLinks from './../components/dashboard-element/DashboardLinks'
export default {
    components: {
      DashboardOverview,
      DashboardLinks
    }
}
</script>
<template>
<div id="dashboard-page">
  <dashboard-overview></dashboard-overview>
  <dashboard-links></dashboard-links>
</div>
</template>
<style>
#dashboard-page {
  width:100%;
  height:calc(100% - 80px);
}
</style>