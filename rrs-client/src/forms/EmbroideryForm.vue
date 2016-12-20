<script>
  import {embroideryUrl} from './../config'
  export default {
    data () {
      return {
        art_file: 'onlyArt',
        options: [
          { text: 'Yes', value: 'yes' },
          { text: 'No', value: 'no' }
        ],
        ai_file: 'ai',
        tape_options: [
          { text: 'Front', value: 'front' },
          { text: 'Left', value: 'left' },
          { text: 'Right', value: 'right' }
        ],
        tape_pos_1: 'tape_1',
        tape_pos_2: 'tape_2',
        tape_pos_3: 'tape_3',
        form_submit: {
          po_num: '',
          address: '',
          customer_num: '',
          due_date: '',
          tape_num_1: '',
          tape_size_1: '',
          tape_num_2: '',
          tape_size_2: '',
          tape_num_3: '',
          tape_size_3: '',
          vector_file: '',
          art_file_available: '',
          cap_color: '',
          description: '',
          threads: ''
        }
      }
    },
    methods: {
      handleSubmitEmbroidery () {
        const postData = {
          po_num: this.form_submit.po_num,
          address: this.form_submit.address,
          customer_num: this.form_submit.customer_num,
          due_date: this.form_submit.due_date,
          tape_num_1: this.form_submit.tape_num_1,
          tape_size_1: this.form_submit.tape_size_1,
          tape_pos_1: this.tape_pos_1,
          tape_num_2: this.form_submit.tape_num_2,
          tape_size_2: this.form_submit.tape_size_2,
          tape_pos_2: this.tape_pos_2,
          tape_num_3: this.form_submit.tape_num_3,
          tape_size_3: this.form_submit.tape_size_3,
          tape_pos_3: this.tape_pos_3,
          vector_file: this.ai_file,
          art_file_available: this.art_file,
          cap_color: this.form_submit.cap_color,
          description: this.form_submit.description,
          threads: this.form_submit.threads
        }
        this.$http.post(embroideryUrl, postData)
          .then(response => {
            if (response.status === 200) {
              this.$router.push({name: 'dashboard'})
            }
          })
      }
    }
  }
</script>
<template>
<div class="embroidery-form">
<center>
  <h1>Embroidery Request Form</h1>
  <form v-on:submit.prevent="handleSubmitEmbroidery()">
    <table>
      <tbody>
        <tr>
          <td><div>PO#</div><input type="text" name="po_num" value="" v-model="form_submit.po_num" /></td>
          <td><div>Address</div><input type="text" name="address" value="" v-model="form_submit.address" /></td>
          <td></td>
        </tr>
        <tr>
          <td><div>CUST#</div><input type="text" name="cust_num" value="" v-model="form_submit.customer_num" /></td>
          <td><div>Due Date</div><input type="text" name="due_date" value="" v-model="form_submit.due_date" /></td>
          <td></td>
        </tr>
        <tr>
          <td><div>Tape#</div><input type="text" name="tape_1_num" value="" v-model="form_submit.tape_num_1" /></td>
          <td><div>Tape Size</div><input type="text" name="tape_1_size" value="" v-model="form_submit.tape_size_1" /></td>
          <td>
            <select v-model="tape_pos_1">
              <option v-for="option in tape_options">
                {{ option.text }}
              </option>
            </select>
          </td>
        </tr>
        <tr>
          <td><div>Tape#</div><input type="text" name="tape_2_num" value="" v-model="form_submit.tape_num_2" /></td>
          <td><div>Tape Size</div><input type="text" name="tape_2_size" value="" v-model="form_submit.tape_size_2" /></td>
          <td>
            <select v-model="tape_pos_2">
              <option v-for="option in tape_options">
                {{ option.text }}
              </option>
            </select>
          </td>
        </tr>
        <tr>
          <td><div>Tape#</div><input type="text" name="tape_3_num" value="" v-model="form_submit.tape_num_3" /></td>
          <td><div>Tape Size</div><input type="text" name="tape_3_size" value="" v-model="form_submit.tape_size_3" /></td>
          <td>
            <select v-model="tape_pos_3">
              <option v-for="option in tape_options">
                {{ option.text }}
              </option>
            </select>
          </td>
        </tr>
        <tr>
          <td>
            <div>Did you ask for AI/Vector file?</div>
            <select v-model="ai_file">
              <option v-for="option in options">
                {{ option.text }}
              </option>
            </select>
          </td>
          <td>
            <div>Only Art File Available?</div>
            <select v-model="art_file">
              <option v-for="option in options">
                {{ option.text }}
              </option>
            </select>
          </td>
          <td><div>Cap/Color: </div><input type="text" style="margin-left: 15px;" name="cap_color" value="" v-model="form_submit.cap_color" /></td>
        </tr>
      </tbody>
    </table>
    <div class="text-area-div">
      <textarea name="description" value="" placeholder="Description Box..." v-model="form_submit.description"></textarea>
      <textarea name="threads" value="" placeholder="Threads..." v-model="form_submit.threads"></textarea>
    </div>
    <input type="submit" name="embroiderySubmit" value="Submit Form"></input>
  </form>
</center>
</div>
</template>
<style>
.embroidery-form {
  position:absolute;
  margin-top: 10px;
  width:100%;
  background-color: white;
}
.embroidery-form table {
  width:80%;
  border-collapse: collapse;
  background-color: white;
  border: 2px solid black;
}
.embroidery-form table tr td {
  height:40px;
  width: 40%;
  border-bottom: 1px dotted grey;
}
.embroidery-form table tr td:nth-child(3) {
  height:40px;
  width: 20%;
  border-bottom: 1px dotted grey;
}
.embroidery-form table select {
  height:20px;
  width:80px;
  vertical-align: bottom;
  font-size:14px;
}
.embroidery-form table div, input {
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
.embroidery-form input[type=submit] {
  width:300px;
  margin-top: 10px;
  margin-bottom: 10px;
  font-size: 20px;
  float:none;
}
</style>