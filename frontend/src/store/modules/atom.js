import request from '../../utils/request';
import * as types from '../types';

const state = {
  id: undefined,
  title: '',
  abstract: '',
  language: 'language',
  image: '',
  content: '# hello',
  visibility: true,
};

const mutations = {
  [types.SET_ATOM]: (st, payload) => {
    st.id = payload.atom_id;
    st.title = payload.title;
    st.abstract = payload.abstract;
    st.language = payload.language;
    st.image = payload.image;
    st.content = payload.content;
  },
};

const actions = {
  async getAtom({ commit }, payload) {
    const res = await request('GET', `/atom/${payload.id}`, {}, {}, {
      Token: payload.token,
    });

    if (res.ok) {
      commit(types.SET_ATOM, res);
    }
  },

  async postAtom({ commit }, payload) {
    const res = await request('POST', '/atom', {}, {
      title: payload.title,
      abstract: payload.abstract,
      language: payload.language,
      image: payload.image,
      content: payload.content,
    }, {
      Token: payload.token,
    });
    if (res.ok) {
      window.location.href = '/admin';
    }
  },

  async updateAtom({ commit }, payload) {
    const res = await request('PUT', `/atom/${payload.id}`, {}, {
      title: payload.title,
      abstract: payload.abstract,
      language: payload.language,
      image: payload.image,
      content: payload.content,
    }, {
      Token: payload.token,
    });
    if (res.ok) {
      window.location.href = '/admin';
    }
  },
};

export default {
  namespace: 'atom/',
  actions,
  mutations,
  state,
};
