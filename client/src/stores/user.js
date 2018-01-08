import UserService from '../services/userService';

export default {
  namespaced: true,

  state: {
    user: {},
    authenticated: false,
  },

  mutations: {
    signIn: (state, user) => {
      state.user = user;
      state.authenticated = true;
    },
    signOut: (state) => {
      state.user = {};
      state.authenticated = false;
    },
  },

  actions: {
    authAction: ({ commit }) => {
      commit('signOut');
      UserService.auth(
        (res) => {

          // TODO: debug
          console.log('user');
          console.dir(res.data);

          commit('signIn', res.data);
        },
        (err) => {

          // TODO: debug
          console.log('err');
          console.dir(err);

          commit('signOut');

          if (err.response.status != 401) {
            //
            // TODO: error データのコミット部分は共通化しよう！！
            //
            const estat = err.response.status;
            const edata = Array.isArray(err.response.data) ?
              err.response.data : [{ level: 'error',  message: 'server error' }];
            edata.forEach((err) => {
              commit('errors/addServerErrors',
                { status: estat, level: err.level, message: err.message },
                { root: true });
            });
            //
            // TODO: error データのコミット部分は共通化しよう！！
            //
          }
        }
      );
    },
    signOutAction: ({ commit }) => {
      UserService.signOut();
      commit('signOut');
    },
  },
};
