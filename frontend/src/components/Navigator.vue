<template lang="pug">
el-menu.topnav(mode="horizontal")
  el-menu-item(index="1")
    router-link(to="/blog")
      | Home
  el-menu-item(index="2")
    router-link(to="/category/1")
      | Category 1
  el-menu-item(index="3")
    router-link(to="/category/2")
      | Category 2
  el-menu-item(index="4")
    router-link(to="/category/3")
      | Category 3
  el-menu-item(index="5")
    router-link(to="/category/4")
      | Category 4
</template>

<script>
export default {
  name: 'Navigator',
  data: () => ({
    responsive: false,
  }),
  methods: {
  },
};
</script>


<style lang="stylus" scoped>
@import '../assets/style.styl'

.topnav a
  text-decoration none
</style>
