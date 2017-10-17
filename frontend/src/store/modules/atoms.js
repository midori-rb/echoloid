import request from '../../utils/request';
import * as types from '../types';

const state = {
  currentPage: 1,
  totalPage: 1,
  data: [],
};

const mutations = {
  [types.SET_ATOMS]: (st, payload) => {
    st.currentPage = payload.current_page;
    st.totalPage = payload.total_page;
    st.data = payload.data;
  },

  [types.DELETE_ATOM]: (st, payload) => {
    st.data = st.data.filter(item => item.atom_id !== payload.id);
  },
};


const actions = {
  async getAtomList({ commit }, payload) {
    const res = await request('GET', '/atom', {
      page: payload.page,
    }, {}, {
      Token: payload.token,
    });

    if (res.ok) {
      commit(types.SET_ATOMS, res);
    }
  },

  async deleteAtom({ commit }, payload) {
    const res = await request('DELETE', `/atom/${payload.id}`,
      {},
      {},
      {
        Token: payload.token,
      });

    if (res.ok) {
      commit(types.DELETE_ATOM, { id: payload.id });
    }
  },
};

export default {
  namespace: 'atoms/',
  actions,
  mutations,
  state,
};
