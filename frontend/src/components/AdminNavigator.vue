<template lang="pug">
.topnav(:class="{ responsive: responsive }")
  router-link(to="/blog")
    | Home
  router-link(to="/admin/atom")
    | Articles
  router-link(to="/admin/post")
    | Posts
  router-link(to="/admin/user")
    | Users
  router-link(to="/admin/media")
    | Media
  router-link(to="/admin/misc")
    | Misc
  a(href="javascript:void(0)", @click="logout")
    | Logout
  a.icon(href="javascript:void(0)", @click="expand")
    | &#9776;
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
    expand() {
      this.responsive = !this.responsive;
    },
  },
};
</script>


<style lang="stylus" scoped>
@import '../assets/style.styl'

.topnav
  width: 100%
  overflow hidden
  background-color colorAccent

.topnav a
  float left
  display block
  color #fff
  text-align center
  padding 14px 16px
  text-decoration none
  font-size 17px

.topnav a:hover
  background-color #ddd
  color black

.topnav .icon
  display: none

@media screen and (max-width: 600px)
  .topnav a:not(:first-child)
    display none
  .topnav a.icon
    float right
    display block

@media screen and (max-width: 600px)
  .topnav.responsive
    position relative
  .topnav.responsive .icon
    position absolute
    right 0
    top 0
  .topnav.responsive a
    float none
    display block
    text-align left
</style>
