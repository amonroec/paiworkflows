<template>
<div class="artpack-form">
<center>
  <h1>Artpack Request Form</h1>
  <form v-on:submit.prevent="pullWorkflow()">
    <table>
      <tbody>
        <tr>
          <td colspan="2">
            <div style="text-align:right;">ARTPACK #</div>
            <input 
              type="text"
              style="margin-left:5px;width:22%;"
              name="artpack_num"
              value=""
              v-model="form_submit.artpack_num"
            />
          </td>
        </tr>
        <tr>
          <td>
            <div>Rep Name*</div>
              <input
                type="text"
                name="rep_name"
                value=""
                v-model="form_submit.rep_name"
                required
              />
          </td>
          <td>
            <div>Turn Time</div>
              <input
                type="text"
                name="turn_time"
                value=""
                v-model="form_submit.turn_time"
              />
          </td>
        </tr>
        <tr>
          <td>
            <div>Account Name*</div>
              <input
                type="text"
                name="account_name"
                value=""
                v-model="form_submit.account_name"
                required
              />
          </td>
          <td>
            <div>Account#</div>
              <input
                type="text"
                name="account_num"
                value=""
                v-model="form_submit.account_num"
              />
          </td>
        </tr>
        <tr>
          <td>
            <div>Customer Name*</div>
              <input
                type="text"
                name="customer_name"
                value=""
                v-model="form_submit.customer_name"
                required
              />
          </td>
          <td>
            <div>Reference Tapes</div>
              <input
                type="text"
                name="reference_tapes"
                value=""
                v-model="form_submit.reference_tapes"
              />
          </td>
        </tr>
        <tr>
          <td>
            <div>Package Type*</div>
              <input
                type="text"
                name="package_type"
                value=""
                v-model="form_submit.package_type"
                required
            />
          </td>
          <td>
            <div>Style Preference</div>
              <input
                type="text"
                name="style_preference"
                value=""
                v-model="form_submit.style_preference"
              />
          </td>
        </tr>
        <tr>
          <td>
            <div>Location of Course</div>
              <input
                type="text"
                name="location_course"
                value=""
                v-model="form_submit.location_course"
              />
          </td>
          <td>
            <div>CSR Name</div>
              <input
                type="text"
                name="csr_name"
                value=""
                v-model="form_submit.csr_name"
              />
          </td>
        </tr>
        <tr>
          <td>
            <div>Can We Manipulate The Logo?*</div>
            <select v-model="selected">
              <option v-for="option in options">
                {{ option.text }}
              </option>
            </select>
          </td>
          <td>
            <div>Number of Designs*</div>
              <input
                type="text"
                name="design_num"
                value=""
                v-model="form_submit.design_num"
                required
              />
          </td>
        </tr>
      </tbody>
    </table>
    <div class="text-area-div">
      <textarea
        name="description_box"
        value=""
        v-model="form_submit.description_box"
        placeholder="Description Box..."
      ></textarea>
      <textarea
        name="threads"
        value=""
        v-model="form_submit.threads"
        placeholder="Threads..."
      ></textarea>
      <div v-if="!image">
        <h2>Select an image</h2>
        <input type="file" @change="onFileChange">
      </div>
      <div v-else>
        <img :src="image" />
        <button @click="removeImage">Remove image</button>
      </div>
    </div>
    <input
      type="submit"
      name="artpackSubmit"
      value="Submit Form"
    ></input>
  </form>
</center>
</div>
</template>
<script>
module.exports = require('./js/artpack-form.js')
</script>
<style>
.artpack-form {
  position:absolute;
  margin-top: 10px;
  width:100%;
  background-color: white;
}
.artpack-form table {
  width:80%;
  border-collapse: collapse;
  background-color: white;
  border: 2px solid black;
}
.artpack-form table tr td {
  height:40px;
  width: 50%;
  border-bottom: 1px dotted grey;
}
.artpack-form table select {
  height:20px;
  width:80px;
  vertical-align: bottom;
  font-size:14px;
}
.artpack-form table div, input {
  width:45%;
  float:left;
}
.text-area-div {
  padding-left:2%;
  padding-top: 1%;
  width:78%;
  height:200px;
  background-color: #e0e0e0;
}
.text-area-div textarea {
  width:48%;height:90%;float:left;margin:4px;max-height:90%;max-width:48%;
}
.artpack-form input[type=submit] {
  width:300px;
  margin-top: 10px;
  margin-bottom: 10px;
  font-size: 20px;
  float:none;
}
</style>