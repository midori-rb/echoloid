<template lang="pug">
el-menu.topnav(mode="horizontal")
  el-menu-item(index="1")
    router-link(to="/blog")
      | Home
  el-menu-item(index="2")
    router-link(to="/admin")
      | Admin
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
