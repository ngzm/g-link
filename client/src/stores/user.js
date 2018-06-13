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
    authAction: ({ state, commit, dispatch }) => {
      commit('signOut');
      UserService.auth(
        (res) => {
          commit('signIn', res.data);
          dispatch('uiInfobar/onAction', `ようこそ ${state.user.name} さん`, { root: true });
        },
        (err) => {
          if (err.response.status != 401) {
            dispatch('errors/setServerErrors',
              { stat: err.response.status, errors: err.response.data },
              { root: true });
          }
        }
      );
    },
    signOutAction: ({ commit, dispatch }) => {
      UserService.signOut();
      commit('signOut');
      dispatch('uiInfobar/onAction', 'ログアウトしました', { root: true });
    },
  },
};
