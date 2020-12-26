<template lang="pug">
.blog-card
  el-card(:body-style="{padding: '0px'}")
    img.image(:src="thumbnail")
    .content
      div
        | {{ title }}
      .language
        | {{ $t(language) }}
      .bottom.clearfix
        span.time
          | {{ $t('created', {author, date: new Date(date.replace(/-/g, '/')).toLocaleString()}) }}
        el-button-group.button-group
          el-button.button(type="text", @click="$emit('delete')")
            | {{ $t('delete') }}
          el-button.button(type="text", @click="$router.push({ name: 'editor', params: { id: id }})")
            | {{ $t('edit') }}
</template>

<script>
export default {
  name: 'BlogCard',
  components: {},
  props: {
    id: {
      type: Number,
      default: 1,
    },
    title: {
      type: String,
      default: '你好世界',
    },
    thumbnail: {
      type: String,
      default: 'http://via.placeholder.com/700x300',
    },
    language: {
      type: String,
      default: 'zh-cn',
    },
    abstract: {
      type: String,
      default: 'Lorem Ipsum',
    },
    author: {
      type: String,
      default: 'Delton',
    },
    date: {
      type: String,
      default: '2017-10-22',
    },
  },
};
</script>

<style lang="stylus" scoped>
.blog-card
  padding 0 0 20px 0

.language
  font-size 13px
  color #999

.time
  padding-top 4px
  font-size 13px
  color #999

.content
  padding: 14px

.bottom
  margin-top 13px
  line-height 12px

.button-group
  padding 0
  float right

.image
  width 100%
  display block

.clearfix:after
  clear both

.button
  padding-left 12px
</style>
