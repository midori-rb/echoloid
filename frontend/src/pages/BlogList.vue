<template lang="pug">
.blog-list
  navigator
  .container
    .blogs
      blog-card(v-for="blog in blogs", :key="blog.id")
    .side-bar
      | 123
</template>

<script>
import BlogCard from '@/components/BlogCard';
import Navigator from '@/components/Navigator';

export default {
  name: 'BlogList',
  components: {
    BlogCard,
    Navigator,
  },
  data: () => ({
    blogs: [
      {
        id: 1,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 2,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
    ],
  }),
};
</script>

<style lang="stylus" scoped>
.container
  display flex
  width 100%

.blogs
  flex 1
  padding 40px

.side-bar
  display none
  width 300px

@media (min-width: 800px)
  .side-bar
    display block
</style>
