<script>
  import {requestUrl, getHeader} from './../config'
  export default {
    data () {
      return {
        selected: 'nike',
        options: [
          { text: 'ASI', value: 'asi' },
          { text: 'Imperial', value: 'imp' },
          { text: 'Nike', value: 'nike' }
        ],
        user_request: {
          first_name: '',
          last_name: '',
          phone_number: '',
          phone_extension: '',
          division: '',
          email: ''
        }
      }
    },
    methods: {
      handleRequestUser () {
        const postData = {
          grant_type: 'password',
          _token: {headers: getHeader()},
          first_name: this.user_request.first_name,
          last_name: this.user_request.last_name,
          phone_number: this.user_request.phone_number,
          phone_extension: this.user_request.phone_extension,
          division: this.selected,
          email: this.user_request.email
        }
        this.$http.post(requestUrl, postData)
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
<div id="request-wrapper">
<center> 
<div class="request-box">
  <div class="login-header">
    <center>
      <img src="./../assets/pai-logo.png" id="pai-logo-login"></img><br />
      <a style="font-size:15px;font-family:verdana;">Request and Review System</a>
    </center>
  </div>
  <div class="request-form">
    <center>
      <form v-on:submit.prevent="handleRequestUser()">
        <table>
          <tr>
            <td>
              <input
                type="text"
                name="first_name"
                value=""
                placeholder="First Name"
                v-model="user_request.first_name"
                required 
              />
            </td>
            <td>
              <input
                type="text"
                name="last_name"
                value=""
                placeholder="Last Name"
                v-model="user_request.last_name"
                required
              />
            </td>
          </tr>
          <tr>
            <td>
              <div class="phone-boxes">
                <input
                  style="float:left;margin-left:-3px;width:70%;"
                  type="text"
                  name="phone_number"
                  value=""
                  placeholder="Phone #"
                  v-model="user_request.phone_number" 
                />
                <input
                  style="float:left;margin-left:2px;width:22%;"
                  type="text"
                  name="phone_extension"
                  value=""
                  placeholder="Ext."
                  v-model="user_request.phone_extension"
                />
              </div>
            </td>
            <td>
                <select v-model="selected">
                  <option v-for="option in options">
                    {{ option.text }}
                  </option>
                </select>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input
                style="width:97%;"
                type="email"
                name="email"
                value=""
                placeholder="E-mail"
                v-model="user_request.email"
                required
              />
            </td>
          </tr>
          <tr>
            <td colspan="2"><textarea name="reason_for_request" placeholder="Reason For Requesting..."></textarea></td>
          </tr>
        </table> 
        <input type="hidden" name="_token" v-bind:value="'' + getHeader + ''">
        <input type="submit" name="submit_request" value="Request Access" id="request-button"></input>
      </form>
    </center>
  </div>
</div>
</center>
</div>
</template>
<style>
#request-wrapper {
  position:absolute;
  margin:0;
  margin-top:-40px;
  width:100%;
  height:100%;
  background-image: url(./../assets/login-background.png);
  background-size: cover;
}
.request-box {
  margin-top:80px;width:600px;height:450px;position:relative;background-color:#e0e0e0;border:1px solid black;
  box-shadow:6px 6px 0px 0px rgba(48,48,48,.5);
}
.login-header {
  position:relative;width:100%;float:left;text-align:center;margin-bottom:25px;
}
#pai-logo-login {
  position:relative;width:210px;margin-top:25px;margin-bottom:-5px;
}
.request-form {
  position:relative;width:100%;float:left;text-align:center;
}
.request-form table {
  border-spacing: 0;
  width:90%;
}
.request-form tr td {
  padding: 0px;
  margin-top: 10px;
  text-align:center;
  width: 50%;
}
.request-form textarea {
  width:97%;
  height:80px;
  margin-top:5px;
  resize: none;
  font-size:17px;
}
.request-form input {
  width:95%;
  height:25px;
  font-size: 18px;
  margin-top:5px;
  vertical-align: 25px;
}
.request-form select {
  width:95%;
  height:25px;
  font-size: 18px;
  margin-top:15px;
}
#request-button {
  width:200px;height:40px;background-color:#779c4c;color:white;font-family:verdana;font-size:23px;border:1px solid black;margin-top:10px;
}
.phone-boxes {
  width:100%;
  margin-top: 10px;
  margin-left:4px;
}
</style>