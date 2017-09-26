<template lang="pug">
.alert-container(:class="{ hide: !display }")
  .transparent(@click="hide")
  .alert
    .content
      .message
        | {{ message }}
</template>

<script>
import { mapState, mapMutations } from 'vuex';
import * as types from '../store/types';

export default {
  name: 'AlertBox',
  computed: {
    message() {
      return this.$t(this.messageKey);
    },
    ...mapState({
      display: state => state.alert.display,
      messageKey: state => state.alert.messageKey,
    }),
  },
  methods: {
    ...mapMutations({
      hide: types.HIDE_ALERT,
    }),
  },
};
</script>

<style lang="stylus" scoped>
.hide
  display none
  z-index 0
.transparent
  position fixed
  z-index 1000
  top 0
  right 0
  left 0
  bottom 0
  background #cccccc
  opacity 0.3
.alert
  position fixed
  z-index 5000
  width 300px
  height 200px
  top 180px
  left calc(50% - 150px)
  text-align center
  background: #fff
  border-radius 20px
.content
  display flex
  height 200px
  align-items center
  justify-content center
</style>
