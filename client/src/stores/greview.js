import GameService from '../services/GameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    review: {},
    reviewStatus: dataStatus.INITIAL,
    newMode: false,
  },

  mutations: {
    setReview: (state, review) => {
      state.review = review;
    },
    setReviewStatus: (state, stat) => {
      state.reviewStatus = stat;
    },
    setNewMode: (state, mode) => {
      state.newMode = mode;
    },
  },

  actions: {
    fetchReview: ({ commit, dispatch }, id) => {
      commit('setReviewStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGameReview(id,
        (res) => {
          commit('setReview', res.data);
          commit('setNewMode', false);
          commit('setReviewStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          if (err.response.status == 404) {
            commit('setNewMode', true);
            commit('setReview', { game_id: id, comment: '', star: 3 });
            commit('setReviewStatus', dataStatus.ACCESSIBLE);
          } else {
            commit('setReview', {});
            commit('setReviewStatus', dataStatus.ERROR);
            dispatch('errors/setServerErrors',
              { stat: err.response.status, errors: err.response.data },
              { root: true });
          }
        }
      );
    },
    registerReview: ({ state, commit, dispatch }, review) => {
      commit('setReviewStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });

      let func = null;
      if (state.newMode) {
        func = GameService.createGameReview;
      } else {
        func = GameService.updateGameReview;
      }
      func.call(GameService, Object.assign(state.review, review),
        (res) => {
          commit('game/setGame', res.data, { root: true });
          commit('games/spliceGames', res.data, { root: true });
          commit('setReview', {});
          commit('setNewMode', false);
          commit('setReviewStatus', dataStatus.REGISTERED);
        },
        (err) => {
          commit('setReview', {});
          commit('setReviewStatus', dataStatus.ERROR);
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
  },
};
