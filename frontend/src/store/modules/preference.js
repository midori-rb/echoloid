import Vue from 'vue';
import * as types from '../types';
import translation from '../../translation';

const safeLanguage = name => (translation[name] ? name : 'en-us');

const state = {
  lang: safeLanguage((navigator.language || navigator.browserLanguage).toLowerCase()),
};

const mutations = {
  [types.SET_LANG]: (vuexState, lang) => {
    vuexState.lang = lang;
    Vue.config.lang = lang;
  },
};

export default {
  namespace: 'preference/',
  state,
  mutations,
};
