export default {
  namespaced: true,

  state: {
    httpStatus: 0,
    serverErrors: [],
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

  getters: {
    serious: (state) => {
      return state.httpStatus >= 500;
    },
  },
};
