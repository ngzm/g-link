import InfoService from '../services/infoService';

export default {
  namespaced: true,

  state: {
    token: {},
    contactSent: false,
  },
  mutations: {
    setToken: (state, token) => {
      state.token = token;
    },
    setContactSent: (state, flg) => {
      state.contactSent = flg;
    },
  },
  actions: {
    sendContact: ({ state, commit, dispatch }, contact) => {
      commit('setContactSent', false);
      dispatch('uiSpinner/spin', null, { root: true });
      commit('errors/clearServerErrors', null, { root: true });

      const sendData = Object.assign(contact, state.token);

      InfoService.sendContact(sendData,
        (res) => {
          dispatch('uiSpinner/stop', null, { root: true });
          dispatch('uiInfobar/onAction',
            `${res.data.name} 様のお問い合わせをサイト管理者に送信しました`,
            { root: true });
          commit('setContactSent', true);
        },
        (err) => {
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
          dispatch('uiSpinner/stop', null, { root: true });
        }
      );
    },
    getToken: ({ commit, dispatch }) => {
      commit('setContactSent', false);
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
