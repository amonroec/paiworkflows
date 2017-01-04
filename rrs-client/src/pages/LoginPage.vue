<script>
  import {loginUrl, getHeader, userUrl} from './../config'
  import {clientId, clientSecret} from './../env'
  export default {
    data () {
      return {
        login: {
          email: 'amc_080@hotmail.com',
          password: 'password'
        }
      }
    },
    methods: {
      handleLoginFormSubmit () {
        const postData = {
          grant_type: 'password',
          client_id: clientId,
          client_secret: clientSecret,
          username: this.login.email,
          password: this.login.password,
          scope: ''
        }
        const authUser = {}
        this.$http.post(loginUrl, postData)
          .then(response => {
            if (response.status === 200) {
              console.log(response)
              authUser.access_token = response.data.access_token
              authUser.refresh_token = response.data.refresh_token
              window.localStorage.setItem('authUser', JSON.stringify(authUser))
              this.$http.get(userUrl, {headers: getHeader()})
                .then(response => {
                  console.log('user division', response.body.division)
                  authUser.email = response.body.email
                  authUser.name = response.body.name
                  window.localStorage.setItem('authUser', JSON.stringify(authUser))
                  window.sessionStorage.setItem('userDivision', response.body.division)
                  window.sessionStorage.setItem('accessLevel', response.body.access_level)
                  this.$router.push({name: 'dashboard'})
                })
            }
          }, (response) => {
            window.alert('Username and/or Password is Incorrect. Please Try Again.')
          })
      }
    }
  }
</script>
<template>
<div id="login-wrapper">
<center>
<div class="login-box">
  <div class="login-header">
    <center>
      <img src="./../assets/pai-logo.png" id="pai-logo-login"></img><br />
      <a style="font-size:15px;font-family:verdana;">Request and Review System</a>
    </center>
  </div>
  <div id="login-form">
    <center>
      <form v-on:submit.prevent="handleLoginFormSubmit()">
        <div class="login-user-box">
          <div class="login-emblems"><img src="../assets/dark50/Email.png"></img></div>
          <input id="login-textbox" type="text" name="email" value="" placeholder="E-mail.."
            class="form-control"
            v-model="login.email"
          >
        </div>
        <div class="login-user-box">
          <div class="login-emblems"><img src="../assets/dark50/Key Filled.png"></div>
          <input id="login-textbox" type="password" name="password" value="" placeholder="Password.."
            class="form-control"
            v-model="login.password"
          >
        </div>
        <input type="submit" name="submitLogin" value="Login" id="login-button"></input>
      </form>
      <div id="userForgotDiv">
          <router-link
            class="user-link"
            to="/forgot-password"
          >
            Forgot Password?
          </router-link>
          <router-link 
            class="user-link"
            to="/request-user"
          >
            Request Access
          </router-link>
        </div>
    </center>
  </div>
</div>
</center>
</div>
</template>