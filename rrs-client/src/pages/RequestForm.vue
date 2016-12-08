<script>
export default {

}
</script>
<template>
<div class="embroidery-form">
<center>
  <h1>Embroidery Request Form</h1>
  <table>
    <tbody>
      <tr>
        <td>PO#</td>
        <td><input type="text" name="po_num" value="" /></td>
        <td>Address</td>
        <td colspan="2"><input type="text" name="address" value="" /></td>
      </tr>
      <tr>
        <td>CUST#</td>
        <td><input type="text" name="cust_num" value="" /></td>
        <td>Due Date</td>
        <td colspan="2"><input type="text" name="due_date" value="" /></td>
      </tr>
      <tr>
        <td>Tape#</td>
        <td><input type="text" name="tape_1_num" value="" /></td>
        <td>Tape Size</td>
        <td><input type="text" name="tape_1_size" value="" /></td>
        <td>
          <select>
            <option value="front">Front</option>
            <option value="left-side">Left Side</option>
            <option value="right-side">Right Side</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Tape#</td>
        <td><input type="text" name="tape_2_num" value="" /></td>
        <td>Tape Size</td>
        <td><input type="text" name="tape_2_size" value="" /></td>
        <td>
          <select>
            <option value="front">Front</option>
            <option value="left-side">Left Side</option>
            <option value="right-side">Right Side</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Tape#</td>
        <td><input type="text" name="tape_3_num" value="" /></td>
        <td>Tape Size</td>
        <td><input type="text" name="tape_3_size" value="" /></td>
        <td>
          <select>
            <option value="front">Front</option>
            <option value="left-side">Left Side</option>
            <option value="right-side">Right Side</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Cap/Color: <input type="text" style="margin-left: 15px;" name="cap_color" value="" /></td>
        <td>Only Art File Available?</td>
        <td>
          <select>
            <option value="yes">Yes</option>
            <option value="no">No</option>
          </select>
        </td>
        <td>Did you ask for AI/Vector file?</td>
        <td>
          <select>
            <option value="yes">Yes</option>
            <option value="no">No</option>
          </select>
        </td>
      </tr>
    </tbody>
  </table>
  <div>
    <textarea name="description_box" value="" placeholder="Description Box..."></textarea>
    <textarea name="threads" value="" placeholder="Threads..."></textarea>
  </div>
  <input type="submit" name="embroiderySubmit" value="Submit Form"></input>
</center>
</div>
</template>
<style>
.embroidery-form {
  position:absolute;
  margin-top: 10px;
  width:100%;
  height:600px;
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
  border-bottom: 2px solid black;
}
.embroidery-form table tr td:nth-child(2) {
  height:40px;
  border-right: 2px dotted #d2d2d2;
}
.embroidery-form table select {
  height:20px;
  width:80px;
  vertical-align: bottom;
  font-size:14px;
}
.embroidery-form div {
  padding-left:2%;
  padding-top: 1%;
  width:78%;
  height:200px;
  background-color: #e0e0e0;
}
.embroidery-form div textarea {
  width:48%;height:90%;float:left;margin:4px;max-height:90%;max-width:48%;
}
.embroidery-form input[type=submit] {
  width:300px;
  margin-top: 10px;
  font-size: 20px;
}
</style>