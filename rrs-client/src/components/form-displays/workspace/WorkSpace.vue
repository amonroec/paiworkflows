<template>
  <div id="workspace">
    <!--
    <task-step></task-step>
    -->
    <div id="form">
      <div style="position: relative;" v-if="currentTask.form_image_url !== null">
        <img :src="formDomain + currentTask.form_image_url" style="width:90%;margin-left:5%;"></img>
        <textarea class="form_description" :value="currentTask.form.description" disabled></textarea>
      </div>
      <div class="uploadsDiv" v-if="currentTask.upload_url !== null">
        <h1>Uploads</h1>
        <div v-for="image in currentTask.upload_url">
          <div v-if="image.substr(image.length - 3) !== 'zip'">
            <img v-show="image.substr(image.length - 3) !== 'pdf'" class="uploaded_file" :src="uploadDomain + image" style="width:90%;" />
            <iframe v-show="image.substr(image.length - 3) === 'pdf'" style="width:90%;height:400px;" :src="uploadDomain + image"></iframe>
          </div>
          <div class="zip_holder" v-else> 
            <div class="zip" type="button" v-on:click="downloadZip(image)">Download Zip
              <i class="fa fa-cloud-download"></i>
            </div>
            <div v-if="image.lastIndexOf('/') === 14" style="position:relative;width:100%;height:30px;float:left;text-align:center;">{{ image.substring(15) }}</div>
            <div v-else style="position:relative;float:left;width:100%;height:100%;text-align:center;">{{ image }}</div>
          </div>
        </div>
        <a href="" id="downloadZip" style="display:none;"></a>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = require('./work-space.js')
</script>