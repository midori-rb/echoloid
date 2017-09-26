<template lang="pug">
.welcome-page
  .container
    .title
      .welcome-logo
        img(src="/static/welcome.png")
      h1
        | midori
    .links
      router-link.link(to="/blog/post/1")
        | {{ $t('intro') }}
      router-link.link(to="/blog")
        | {{ $t('blog') }}
      a.link(href="http://www.rubydoc.info/gems/em-midori/")
        | {{ $t('docs') }}
      a.link(href="https://github.com/heckpsi-lab/em-midori")
        | {{ $t('github') }}
      router-link.link(to="/blog/post/2")
        | {{ $t('about') }}
</template>

<style lang="stylus" scoped>
@import "../assets/style.styl"

.welcome-page
  width 100%
  height calc(100vh - 30px)
  display flex
  align-items center
  justify-content center
  background colorPrimary
  text-align center
  color #ffffff

.title
  display flex

.title .welcome-logo
  width: 30%
  // height: 165px
  margin: 0 20px 0 auto

.title .welcome-logo img
  width 100%
  // height: 165px

.title h1
  font-size: 40px
  margin: auto auto auto 20px

.links
  width: 100%
  display: flex
  margin: 20px 0 0 0

.link
  color white
  text-decoration none
  cursor pointer
  font-size 16px
  font-weight bold
  flex: 1

@media (min-width: 600px)
  #title h1
    font-size: 70px
  .link
    font-size 24px
</style>

