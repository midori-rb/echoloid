import * as marked from 'marked';
import * as highlight from 'highlight.js';
import request from '../../utils/request';
import * as types from '../types';

marked.setOptions({
  highlight(code) {
    return highlight.highlightAuto(code).value;
  },
});

const state = {
  id: undefined,
  title: '',
  abstract: '',
  language: 'language',
  image: '',
  content: '# hello',
  compiled: '<h1 id=\'hello\'>hello</h1>\n',
};

const mutations = {
  [types.SET_ATOM]: (st, payload) => {
    st.id = payload.atom_id;
    st.title = payload.title;
    st.abstract = payload.abstract;
    st.language = payload.language;
    st.image = payload.image;
    st.content = payload.content;
    st.compiled = marked(st.content, { sanitize: true });
  },

  [types.SET_COMPILED]: (st) => {
    st.compiled = marked(st.content, { sanitize: true });
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

  async mark({ commit }) {
    commit(types.SET_COMPILED);
  },
};

export default {
  namespace: 'atom/',
  actions,
  mutations,
  state,
};
