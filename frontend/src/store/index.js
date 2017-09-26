import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import alert from './modules/alert-box';
import preference from './modules/preference';
import user from './modules/user';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    alert,
    preference,
    user,
  },
  plugins: [createPersistedState({
    paths: ['preference', 'user'],
  })],
});

export default store;
