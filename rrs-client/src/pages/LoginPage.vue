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
                  console.log('user obeject', response)
                  authUser.email = response.body.email
                  authUser.name = response.body.name
                  window.localStorage.setItem('authUser', JSON.stringify(authUser))
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
        <div style="width:100%;">
          <router-link
            to="/forgot-password"
            style="float:left;margin:15px;">
            Forgot Password?
          </router-link>
          <router-link 
            to="/request-user"
            style="float:right;margin:15px;"
          >
            Request Access
          </router-link>
        </div>
      </form>

    </center>
  </div>
</div>
</center>
</div>
</template>
<style>
#login-wrapper {
  position:absolute;
  margin:0;
  margin-top:-40px;
  width:100%;
  height:100%;
  background-image: url(./../assets/login-background.png);
  background-size: cover;
}
.login-box {
  margin-top:80px;width:400px;height:400px;position:relative;background-color:#e0e0e0;border:1px solid black;box-shadow:6px 6px 0px 0px rgba(48,48,48,.5);
}
.login-header {
  position:relative;width:100%;float:left;text-align:center;margin-bottom:25px;
}
#pai-logo-login {
  position:relative;width:210px;margin-top:25px;margin-bottom:-5px;
}
#login-form {
  position:relative;width:100%;float:left;text-align:center;
}
.login-user-box {
  width:330px;background-color:white;padding:2px;height:35px;border:1px solid black;margin-bottom:20px;
}
.login-emblems {
  height:100%;width:40px;float:left;background-color:white;font-size:25px;line-height:45px;
}
.login-emblems img {
  width:60%;
  margin-top:5px;
}
#login-textbox {
  width:280px;height:100%;font-size:17px;line-height:17px;margin-left:0px;border:none;float:left;outline:none;padding-left:5px;
}
#login-button {
  width:140px;height:40px;background-color:#779c4c;color:white;font-family:verdana;font-size:23px;border:1px solid black;
}
</style>