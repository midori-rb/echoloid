<template lang="pug">
#app
  router-view.router
  foot-nav
</template>

<script>
import FootNav from '@/components/FootNav';

export default {
  name: 'app',
  components: {
    FootNav,
  },
};
</script>

<style lang="stylus">
body
  margin: 0
  font-family "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif

#app
  position relative
  font-family Helvetica, Arial, sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale

.router
  min-height calc(100vh - 30px)
</style>
