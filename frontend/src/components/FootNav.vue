<template lang="pug">
.footnav
  .note
    | Proudly Powered by Midori and Vue.js
  language-switcher
</template>

<script>
import LanguageSwitcher from '@/components/LanguageSwitcher';

export default {
  name: 'FootNavigator',
  components: {
    LanguageSwitcher,
  },
};
</script>


<style lang="stylus" scoped>
@import '../assets/style.styl'

.footnav
  width 100%
  height 30px
  display flex
  color #fff
  align-items center
  justify-content center
  background-color colorPrimary

.note
  position relative
  text-align center
  margin: auto auto
</style>
