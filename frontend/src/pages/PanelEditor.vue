<template lang="pug">
.container
  admin-navigator
  .panel-editor
    textarea.editor(v-model="atom.content", @input="update")
    .preview-container
      .preview.markdown-body(v-html="atom.compiled")
    .meta
      el-form(label-width="80px")
        el-form-item(:label="$t('title')")
          el-input(v-model="atom.title")
        el-form-item(:label="$t('thumbnail')")
          el-input(v-model="atom.image")
        //- el-form-item(:label="$t('category')")
        //-   el-select(v-model="values", multiple)
        //-     el-option(
        //-       v-for="category in categories",
        //-       :key="category.value",
        //-       :label="category.label",
        //-       :value="category.value")
        el-form-item(:label="$t('language')")
          el-select(v-model="atom.language")
            el-option(
              v-for="language in languages",
              :key="language.value",
              :label="language.label",
              :value="language.value",
              :disabled="language.disabled")
        el-form-item(:label="$t('abstract')")
          el-input(
            type="textarea",
            v-model="atom.abstract",
            :autosize="{ minRows: 2, maxRows: 4}",
            :placeholder="$t('abstract')",
          )
        el-form-item
          el-button(type="primary", @click="submit")
            | {{ $t('submit') }}
          el-button(@click="cancel")
            | {{ $t('cancel') }}
</template>

<script>
import { mapState, mapActions } from 'vuex';
import debounce from 'lodash/debounce';
import AdminNavigator from '@/components/AdminNavigator';
import LanguageOptions from '@/translation/options';

export default {
  components: {
    AdminNavigator,
  },
  data() {
    return {
      values: [],
      categories: [],
      languages: LanguageOptions,
    };
  },
  computed: mapState([
    'user',
    'atom',
  ]),
  methods: {
    update() {
      debounce(this.mark, 300)();
    },
    cancel() {
      this.$router.push('/admin');
    },
    submit() {
      if (this.$route.params.id) {
        // Update
        this.updateAtom({
          token: this.user.token,
          id: this.$route.params.id,
          title: this.atom.title,
          abstract: this.atom.abstract,
          language: this.atom.language,
          image: this.atom.image,
          content: this.atom.content,
        });
        return;
      }
      this.postAtom({
        token: this.user.token,
        title: this.atom.title,
        abstract: this.atom.abstract,
        language: this.atom.language,
        image: this.atom.image,
        content: this.atom.content,
      });
    },
    fetchData() {
      if (this.$route.params.id) {
        this.getAtom({
          token: this.user.token,
          id: this.$route.params.id,
        });
      } else {
        this.clearAtom();
      }
    },
    ...mapActions([
      'getAtom',
      'clearAtom',
      'updateAtom',
      'postAtom',
      'mark',
    ]),
  },
  watch: {
    $route: 'fetchData',
  },
  created() {
    this.fetchData();
  },
};
</script>

<style lang="stylus" scoped>
@import "../assets/github.css"

.panel-editor
  display flex
  height: calc(100vh - 110px)
  padding: 20px 20px 0 20px
.editor
  font-family monospace
  flex 1
  resize none
  border none
  outline none
.preview-container
  flex 1
  overflow hidden
.preview
  width 100%
  height 100%
  overflow scroll
  padding 15px
.meta
  width: 300px
</style>
