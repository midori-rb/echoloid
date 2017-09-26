<template lang="pug">
#app
  router-view.router
  foot-nav
  alert-box
</template>

<script>
import AlertBox from '@/components/AlertBox';
import FootNav from '@/components/FootNav';

export default {
  name: 'app',
  components: {
    AlertBox,
    FootNav,
  },
};
</script>

<style lang="stylus">
body
  margin: 0

#app
  position relative
  font-family Helvetica, Arial, sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale

.router
  min-height calc(100vh - 30px)
</style>
