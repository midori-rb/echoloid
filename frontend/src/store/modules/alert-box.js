import * as types from '../types';

const state = {
  messageKey: '',
  display: false,
};

const mutations = {
  [types.SHOW_ALERT]: (vuexState, message) => {
    vuexState.messageKey = message;
    vuexState.display = true;
  },

  [types.HIDE_ALERT]: (vuexState) => {
    vuexState.display = false;
  },
};

export default {
  namespace: 'alert/',
  state,
  mutations,
};
