<template lang="pug">
#language-switcher
  el-select(v-model="lang", v-on:change="changeLanguage()")
    el-option(v-for="item in options",
              :key="item.value",
              :label="item.label",
              :value="item.value",
              :disabled="item.disabled")
</template>
<script>
import { mapMutations } from 'vuex';
import LanguageOptions from '@/translation/options';
import * as types from '../store/types';

export default {
  name: 'LanguageSwitcher',
  data: () => ({
    lang: 'language',
    options: LanguageOptions,
  }),
  methods: {
    changeLanguage() {
      this.setLang(this.lang);
      location.reload();
    },
    ...mapMutations({
      setLang: types.SET_LANG,
    }),
  },
};
</script>

<style lang="stylus" scoped>
@import '../assets/style.styl'
#language-switcher
  position fixed
  right 50px
  bottom 40px

#selector
  background colorPrimary
  color #fff
  padding 5px
  border 1px solid #fff
</style>
