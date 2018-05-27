import InfoService from '../services/infoService';

export default {
  namespaced: true,

  actions: {
    sendContact: ({ commit, dispatch }, contact) => {
      console.log('sendContact start');
      console.dir(contact);

      commit('errors/clearServerErrors', null, { root: true });

      InfoService.sendContact(contact,
        (res) => {
          console.log('sendContact success');
          console.dir(res);
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
