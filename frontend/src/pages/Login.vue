<template lang="pug">
.login
  el-form(:model="user", label-width="100px")
    el-form-item(:label="$t('username')")
      el-input(v-model="user.username")
    el-form-item(:label="$t('password')" prop="pass")
      el-input(type="password", v-model="user.password", auto-complete="off")
    el-form-item
      el-button(type="primary", @click="login")
        | {{ $t('login') }}
      el-button(@click="reset")
        | Reset
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'Login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
    };
  },
  methods: {
    ...mapActions({
      actionLogin: 'login',
    }),
    login() {
      this.actionLogin(this.user);
    },
    reset() {
      this.user.username = '';
      this.user.password = '';
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
</style>
