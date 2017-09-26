<template lang="pug">
.container
  admin-navigator
  .panel-editor
    textarea.editor(v-model="input", @input="update")
    .preview-container
      .preview.markdown-body(v-html="compiled")
    div.meta
      div
        | Hello World
</template>

<script>
import debounce from 'lodash/debounce';
import * as marked from 'marked';
import * as highlight from 'highlight.js';
import AdminNavigator from '@/components/AdminNavigator';

export default {
  components: {
    AdminNavigator,
  },
  data() {
    return {
      input: '# hello',
      compiled: '<h1 id=\'hello\'>hello</h1>\n',
    };
  },
  methods: {
    update() {
      debounce(this.mark, 300)();
    },
    mark() {
      this.compiled = marked(this.input, { sanitize: true });
    },
  },
  mounted() {
    marked.setOptions({
      highlight(code) {
        console.log('Here');
        console.log(highlight.highlightAuto(code).value);
        return highlight.highlightAuto(code).value;
      },
    });
  },
};
</script>

<style lang="stylus" scoped>
@import "../assets/github.css"

.panel-editor
  display flex
  height: calc(100vh - 97px)
  padding: 17px 17px 0 17px
.editor
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
  width: 200px
</style>
