<template lang="pug">
.blog-card
  el-card(:body-style="{padding: '0px'}")
    img.image(:src="thumbnail")
    .content
      div
        | {{ title }}
      .abstract
        | {{ abstract }}
      .bottom.clearfix
        span.time
          | Published by
          | {{ author }}
          | on
          | {{ date }}
        el-button.button(type="text", @click="$router.push({ name: 'post', params: { postId: id }})")
          | Continue Reading
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

.abstract
  font-size 13px
  color #999

.time
  font-size 13px
  color #999

.content
  padding: 14px

.bottom
  margin-top 13px
  line-height 12px

.button
  padding 0
  float right

.image
  width 100%
  display block

.clearfix:before,
.clearfix:after
  display table
  content ""

.clearfix:after
  clear both
</style>
