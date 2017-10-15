<template lang="pug">
el-menu.topnav(mode="horizontal", theme="dark")
  el-menu-item(index="1")
    router-link(to="/blog")
      | Home
  el-menu-item(index="2")
    router-link(to="/admin/atom")
      | Articles
  el-menu-item(index="3")
    router-link(to="/admin/post")
      | Posts
  el-menu-item(index="4")
    router-link(to="/admin/user")
      | Users
  el-menu-item(index="5")
    router-link(to="/admin/media")
      | Media
  el-menu-item(index="6")
    router-link(to="/admin/misc")
      | Misc
  el-menu-item(index="7")
    a(href="javascript:void(0)", @click="logout")
      | Logout
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'AdminNavigator',
  data: () => ({
    responsive: false,
  }),
  methods: {
    ...mapActions({
      logout: 'logout',
    }),
  },
};
</script>


<style lang="stylus" scoped>
.topnav a
  text-decoration none
</style>
