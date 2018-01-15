export default {
  namespaced: true,

  state: {
    httpStatus: 0,
    serverErrors: [],
  },

  getters: {
    serious: (state) => {
      return state.httpStatus >= 500;
    },
  },

  mutations: {
    addServerErrors: (state, error) => {
      state.httpStatus = error.status;
      state.serverErrors.push(error);
    },
    clearServerErrors: (state) => {
      state.httpStatus = 0;
      state.serverErrors = [];
    },
  },

  actions: {
    setServerErrors: ({ commit }, errObj) => {
      commit('clearServerErrors');
      const stat = errObj.stat;
      const errs = Array.isArray(errObj.errors) ? errObj.errors : [{ level: 'error',  message: 'unknown error' }];
      errs.forEach((e) => {
        commit('addServerErrors', { status: stat, level: e.level, message: e.message });
      });
    },
  },
};
