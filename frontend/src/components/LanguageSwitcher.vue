<template lang="pug">
#language-switcher
  select#selector(v-model="lang" v-on:change="changeLanguage()")
    option(disabled default value="language")
      | Language
    option(value="zh-cn") 
      | 简体中文
    option(value="en-us") 
      | English
    option(value="ja-jp")
      | 日本語
    //- option(value="zh-hk") 
    //-   | 香港繁體
    //- option(value="zh-tw")
    //-   | 臺灣正體
</template>
<script>
import { mapMutations } from 'vuex';
import * as types from '../store/types';

export default {
  name: 'LanguageSwitcher',
  data: () => ({
    lang: 'language',
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
