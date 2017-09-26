import request from '../../utils/request';
import * as types from '../types';

const state = {
  logged: false,
  id: -1,
  token: '',
  username: '',
  usergroup: -1,
};

const mutations = {
  [types.SET_USER]: (st, payload) => {
    st.logged = true;
    st.id = payload.id;
    st.token = payload.token;
    st.username = payload.username;
    st.usergroup = payload.usergroup;
    window.location.href = '/admin';
  },

  [types.CLEAN_USER]: (st) => {
    st.logged = false;
    st.id = -1;
    st.token = '';
    st.username = '';
    st.usergroup = -1;
  },
};

const actions = {
  async login({ commit }, payload) {
    const res = await request('POST', '/user/login', {}, {
      username: payload.username,
      password: payload.password,
    });
    if (res.ok) { commit(types.SET_USER, res); }
    if (res.status === 401) {
      commit(types.SHOW_ALERT, 'passwordIncorrect');
    }
  },

  logout({ commit }) {
    commit(types.CLEAN_USER);
    window.location.href = '/admin';
  },
};

export default {
  namespace: 'user/',
  actions,
  state,
  mutations,
};
