export default {
  namespaced: true,

  state: {
    infobar: false,
    message: '',
  },

  mutations: {
    setInfobar: (state, flg) => {
      state.infobar = flg;
    },
    setMessage: (state, message) => {
      state.message = message;
    },
  },

  actions: {
    onAction: ({ commit }, message) => {
      commit('setMessage', message);
      commit('setInfobar', true);
    },
    modInfobar: ({ commit }, flg) => {
      commit('setInfobar', flg);
    },
  },
};
