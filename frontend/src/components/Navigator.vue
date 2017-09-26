<template lang="pug">
.topnav(:class="{ responsive: responsive }")
  router-link(to="/blog")
    | Home
  router-link(to="/category/1")
    | Category 1
  router-link(to="/category/2")
    | Category 2
  router-link(to="/category/3")
    | Category 3
  router-link(to="/category/4")
    | Category 4
  a.icon(href="javascript:void(0)", @click="expand")
    | &#9776;
</template>

<script>
export default {
  name: 'Navigator',
  data: () => ({
    responsive: false,
  }),
  methods: {
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
  background-color colorPrimary

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
