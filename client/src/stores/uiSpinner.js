export default {
  namespaced: true,

  state: {
    spinner: false,
  },

  mutations: {
    setSpinner: (state, flg) => {
      state.spinner = flg;
    },
  },

  actions: {
    spin: ({ commit }) => {
      commit('setSpinner', true);
    },
    stop: ({ commit }) => {
      commit('setSpinner', false);
    },
  },
};
