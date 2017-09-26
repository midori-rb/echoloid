// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VueI18n from 'vue-i18n';
import VueRouter from 'vue-router';
import App from './App';
import router from './router';
import store from './store';
import translation from './translation';

Vue.use(VueI18n);
Vue.use(VueRouter);

window.$config = {};
if (location.hostname === 'localhost') {
  window.$config.HOST = 'http://localhost:8081';
} else {
  window.$config.HOST = '';
}

Vue.config.productionTip = false;

const i18n = new VueI18n({
  locale: store.state.preference.lang,
  fallbackLocale: 'en-us',
  messages: translation,
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  i18n,
  template: '<App/>',
  components: { App },
});
