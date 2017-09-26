<template lang="pug">
.blog-card
  img.thumbnail(:src="thumbnail")
  h2
    | {{ title }}
  p
    b 
      | {{ author }}
    | &nbsp;Published on&nbsp;
    b
      |{{ date }}
  p
    | {{ abstract }}
  router-link(:to="{ name: 'post', params: { postId: id }}")
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
      default: '2017-01-01',
    },
  },
};
</script>

<style lang="stylus" scoped>
.blog-card
  padding 0 0 20px 0
.thumbnail
  width 100%
</style>
