 <template v-show="actualTask.status !== 'closed'">
  <div :class="parseInt(actualTask.app_worker) === parseInt(userStore.authUser.id) || actualTask.app_group === groupCheck ? 'activeSingleTask' : 'notActiveSingleTask'">
    <div>
      <form class="taskform" v-on:submit.prevent="linkData">
        <div class="activeTask"></div>
        <div class="notActiveTask"></div>
        <i class="fa fa-exclamation-circle" style="position:absolute;right:-265px;top:-8px;z-index:600;color:red;font-size:20px;padding-left: 3px;padding-right: 3px;background-color: white;line-height: 25px;border-radius: 5px;" v-show="notificationShow"></i>
        <div class="task" v-on:click="startLoading(actualTask)">
          <div class="artpack-table-num"><b>A{{ actualTask.form_num }}</b>-{{ actualTask.form.artpack_name }}</div>
          <div>Designs: <b>{{ actualTask.form.package_total }}</b></div>
          <div>Date Req: {{ date }}</div>
          <div>{{ actualTask.form.account_name }} - {{ actualTask.form.account_num }}</div>
          <img v-show="actualTask.status == 'upload'" class="upload fa fa-upload" src="./../../assets/upload.png" ></img>
          <img v-show="actualTask.status == 'review'" class="review fa fa-search" src="./../../assets/review.png" ></img>
          <img v-show="actualTask.status == 'assign_group'" class="assign_group fa fa-plus-square" src="./../../assets/assign_group.png" ></img>
          <!-- <img v-show="actualTask.status == 'assign'" class="assign fa fa-random" src="./../../assets/assign.png" ></img> -->
        </div>
      </form>
    </div>
  </div>
</template>
<script>
module.exports = require('./single-task.js')
</script>