<template>
  <div id="workspace">
    <!--
    <task-step></task-step>
    -->
    <div id="form">
      <!--<h2>Artpack Number Request</h2>
      <div class="accountInfo">
        <div class="formHeader">Account Info</div>
        <div class="formQuestion">Customer Name</div>
        <div class="formAnswer">{{taskStore.currentForm.customer_name ? taskStore.currentForm.customer_name : '---'}}</div>
        <div class="formQuestion">Rep Name</div>
        <div class="formAnswer">{{taskStore.currentForm.rep_name ? taskStore.currentForm.rep_name : '---'}}</div>
        <div class="formQuestion">Account Name</div>
        <div class="formAnswer">{{taskStore.currentForm.account_name ? taskStore.currentForm.account_name : '---'}}</div>
        <div class="formQuestion">Account Num</div>
        <div class="formAnswer">{{taskStore.currentForm.account_num ? taskStore.currentForm.account_num : '---'}}</div>
        <div class="formQuestion">CSR Name</div>
        <div class="formAnswer">{{taskStore.currentForm.person_requesting ? taskStore.currentForm.persron_requesting : '---'}}</div>
        <div class="formQuestion">Turn Time</div>
        <div class="formAnswer">{{taskStore.currentForm.turn_time ? taskStore.currentForm.turn_time : '---'}}</div>
      </div> 
      <div class="artpackDetails">
        <div class="formHeader">Artpack Details</div>
        <div class="formQuestion">Artpack Name</div>
        <div class="formAnswer">{{taskStore.currentForm.artpack_name ? taskStore.currentForm.artpack_name : '---'}}</div>
        <div class="formQuestion">Reference Art</div>
        <div class="formAnswer">{{taskStore.currentForm.account_name ? taskStore.currentForm.account_name : '---'}}</div>
        <div class="formQuestion">Package Type</div>
        <div class="formQuantity">{{taskStore.currentForm.package_domestic ? taskStore.currentForm.package_domestic : '---'}}</div>
        <div class="formQuantityType">Domestic</div>
        <div class="formQuantity">{{taskStore.currentForm.package_q30 ? taskStore.currentForm.package_q30 : '---'}}</div>
        <div class="formQuantityType">Q30</div>
        <div class="formQuantity">{{taskStore.currentForm.package_c60 ? taskStore.currentForm.package_c60 : '---'}}</div>
        <div class="formQuantityType">C60</div>
        <div class="formQuestion"></div>
        <div class="formQuantity">{{taskStore.currentForm.package_full_custom ? taskStore.currentForm.package_full_custom : '---'}}</div>
        <div class="formQuantityType">Custom</div>
        <div class="formQuantity">{{taskStore.currentForm.package_core20 ? taskStore.currentForm.package_core20 : '---'}}</div>
        <div class="formQuantityType">Core 24</div>
        <div class="formQuantity">{{taskStore.currentForm.package_total ? taskStore.currentForm.package_total : '---'}}</div>
        <div class="formQuantityType">Total Designs</div>
        <div class="formQuestion">Style Preference</div>
        <div class="formAnswer">{{taskStore.currentForm.style_preference ? taskStore.currentForm.style_preference : '---'}}</div>
        <div class="formQuestion">Logo Manip.</div>
        <div class="formAnswer">{{taskStore.currentForm.manipulate_logo ? taskStore.currentForm.manipulate_logo : '---'}}</div>
        <div class="formQuestion">Comments</div>
        <div class="formComments">{{taskStore.currentForm.description ? taskStore.currentForm.description : '---'}}</div>
      </div> 
-->
      <div v-if="currentTask.form_image_url !== null">
        <img :src="'http://paiworkflows.com/server/workflows_server/public/assets/forms/' + currentTask.form_image_url" style="width:90%;padding-left:10%;"></img>
      </div>
      <div class="uploadsDiv" v-if="currentTask.upload_url !== null">
        <h1>Uploads</h1>
        <div v-for="image in currentTask.upload_url">
            <img v-show="image.substr(image.length - 3) !== 'pdf'" class="uploaded_file" :src="'http://paiworkflows.com/server/workflows_server/public/' + image" style="width:90%;"></img>
            <iframe v-show="image.substr(image.length - 3) === 'pdf'" style="width:90%;height:400px;" :src="'http://paiworkflows.com/server/workflows_server/public/' + image"></iframe>
        </div>
      </div>
<!--
      <div class="image-bar">
        <a v-for="(image, index) in currentTask.upload_url" href="javascript:void(0)" v-on:click="scrollToFile(index)">
          <div class="image-link">1</div>
        </a>
      </div>

      <div class="artpackFiles">
        <div class="formHeader">Uploads</div>
        <div class="formQuestion">Uploaded Files</div>
        <div class="formUploads"></div>
      </div>
-->
    </div>
  </div>
</template>
<script>
module.exports = require('./work-space.js')
</script>