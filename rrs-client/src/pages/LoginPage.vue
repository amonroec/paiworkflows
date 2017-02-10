<script>
  import {loginUrl, getHeader, userUrl, getUserData} from './../config'
  import {clientId, clientSecret} from './../env'
  import GSignInButton from 'vue-google-signin-button'
  import {mapState} from 'vuex'
  export default {
    data () {
      return {
        login: {
          email: '',
          password: ''
        },
        googleSignInParams: {
          client_id: '700357075201-feeks33sjmv3mfo7h9npi48h7evml642.apps.googleusercontent.com',
          hosted_domain: 'paifashion.com',
          prompt: 'select_account'
        },
        profile: ''
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
                  window.sessionStorage.setItem('authUser', JSON.stringify(authUser))
                  window.sessionStorage.setItem('userId', response.body.id)
                  window.sessionStorage.setItem('userDivision', response.body.division)
                  window.sessionStorage.setItem('accessLevel', response.body.access_level)
                  window.sessionStorage.setItem('userName', response.body.name)
                  this.$router.push({name: 'home'})
                })
            }
          }, (response) => {
            window.alert('Username and/or Password is Incorrect. Please Try Again.')
          })
      },
      onSignInSuccess (googleUser) {
        this.profile = googleUser
        console.log(this.profile)
        const postData = {
          email: this.profile['w3'].U3,
          name: this.profile['w3'].ig
        }
        this.$http.post(getUserData, postData)
          .then(response => {
            if (response.status === 200 && response.data.length !== 0) {
              console.log(response.data)
              const authUser = {}
              authUser.access_token = this.profile['Zi'].access_token
              authUser.refresh_token = ''
              authUser.email = response.data[0].email_address
              authUser.name = response.data[0].name
              authUser.id = response.data[0].id
              authUser.admin = response.data[0].admin
              authUser.department = response.data[0].department
              authUser.picture = this.profile['w3'].Paa
              window.localStorage.setItem('authUser', JSON.stringify(authUser))
              this.$store.dispatch('setUserObject', authUser)
              this.$router.push('/home')
            } else {
              console.log('you dont have an account')
            }
          })
      },
      onSignInError (error) {
        console.log('OH NOES', error)
      },
      getDomain () {
        var domain = this.login.email
        domain = domain.slice(-14)
        this.googleSignInParams.hosted_domain = domain
        console.log(domain)
      }
    },
    computed: {
      ...mapState({
        userStore: state => state.userStore
      })
    },
    components: {
      GSignInButton
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
      <g-signin-button
        :params.sync="googleSignInParams"
        @success="onSignInSuccess"
        @error="onSignInError">
        Sign in with Google
      </g-signin-button>
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