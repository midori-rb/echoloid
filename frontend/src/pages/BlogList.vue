<template lang="pug">
.blog-list
  navigator
  .container
    .blogs
      blog-card(v-for="blog in blogs", :key="blog.id")
      el-pagination(:current-page.sync="currentPage",
                    :page-size="1",
                    layout="prev, pager, next, jumper",
                    :total="totalPage")
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
    currentPage: 1,
    totalPage: 10,
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
      {
        id: 3,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 4,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 5,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 6,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 7,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 8,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 9,
        title: '你好世界',
        author: 'TEST',
        thumbnail: 'http://via.placeholder.com/350x150',
        abstract: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      },
      {
        id: 10,
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
