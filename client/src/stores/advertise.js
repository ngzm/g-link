import AdvertiseService from '../services/advertiseService';
import { advertiseSize } from './StoreStatus';

class AdvertiseHelper {
  static arrangeAdvertises(adbase, adsize) {
    if (!Array.isArray(adbase)) {
      return [];
    }
    let display = [];
    for (let i = 0; i < adsize; i++) {
      const ads = adbase.filter((a) => {
        return a.priority === i + 1;
      });
      if (ads.length <= 0) {
        display[i] = { title: 'default', description: 'default', src: 'default' };
      } else if (ads.length === 1) {
        display[i] = ads[0];
      } else {
        const idx = Math.floor(Math.random() * ads.length);
        display[i] = ads[idx];
      }
    }
    return display;
  }
}

export default {
  namespaced: true,

  state: {
    advertisesHome: [],
    advertisesRank: [],
    displayHome: [],
    displayRank: [],
  },

  mutations: {
    setAdvertisesHome: (state, ad) => {
      state.advertisesHome = ad;
    },
    setAdvertisesRank: (state, ad) => {
      state.advertisesRank = ad;
    },
    clearAdvertises: (state) => {
      state.advertisesHome = [];
      state.advertisesRank = [];
      state.displayHome = [];
      state.displayRank = [];
    },
    arrangeDisplayHome: (state) => {
      state.displayHome = AdvertiseHelper.arrangeAdvertises(
        state.advertisesHome,
        advertiseSize.DISP_HOME_SIZE
      );
    },
    arrangeDisplayRank: (state) => {
      state.displayRank = AdvertiseHelper.arrangeAdvertises(
        state.advertisesRank,
        advertiseSize.DISP_RANK_SIZE
      );
    },
  },

  actions: {
    fetchAdvertise: ({ commit, dispatch }, adtype) => {
      commit('clearAdvertises');
      commit('errors/clearServerErrors', null, { root: true });
      AdvertiseService.fetchAdvertise(adtype,
        (res) => {
          if (adtype === 1) {
            commit('setAdvertisesHome', res.data);
            commit('arrangeDisplayHome');
          }
          else if (adtype === 2) {
            commit('setAdvertisesRank', res.data);
            commit('arrangeDisplayRank');
          }
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
