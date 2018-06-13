import InfoService from '../services/infoService';

export default {
  namespaced: true,

  state: {
    token: {},
  },
  mutations: {
    setToken: (state, token) => {
      state.token = token;
    },
  },
  actions: {
    sendContact: ({ state, commit, dispatch }, contact) => {
      const sendData = Object.assign(contact, state.token);
      commit('errors/clearServerErrors', null, { root: true });

      InfoService.sendContact(sendData,
        (res) => {
        },
        (err) => {
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
    getToken: ({ commit, dispatch }) => {
      commit('errors/clearServerErrors', null, { root: true });

      InfoService.getToken(
        (res) => {
          commit('setToken', res.data);
        },
        (err) => {
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
  },
};
