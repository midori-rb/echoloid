<template lang="pug">
.login
  .login-box
    input.input(:placeholder="$t('username')", v-model="username")
    input.input(:placeholder="$t('password')", v-model="password", type="password")
    button.button(@click="login")
      | {{ $t('login') }}
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'Login',
  components: {},
  data() {
    return {
      username: '',
      password: '',
    };
  },
  methods: {
    ...mapActions({
      actionLogin: 'login',
    }),
    login() {
      this.actionLogin({
        username: this.username,
        password: this.password,
      });
    },
  },
};
</script>

<style lang="stylus" scoped>
@import "../assets/style.styl"
.login
  width 100%
  display flex
  align-items center
  justify-content center
.input
  width: 80%
  margin: 12px 12px 12px 12px
  padding: 16px
  text-align: center
  font-size: 20px
.button
  width: 80%
  margin: 12px 12px 12px 12px
  box-sizing: content-box
  background: colorPrimary
  border: none
  color: #fff
  padding: 16px
  text-align: center
  font-size: 20px
</style>
