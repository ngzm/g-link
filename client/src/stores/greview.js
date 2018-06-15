import GameService from '../services/gameService';
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
      dispatch('uiSpinner/spin', null, { root: true });
      commit('setReviewStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGameReview(id,
        (res) => {
          commit('setReview', res.data);
          commit('setNewMode', false);
          commit('setReviewStatus', dataStatus.ACCESSIBLE);
          dispatch('uiSpinner/stop', null, { root: true });
        },
        (err) => {
          if (err.response.status == 404) {
            commit('setNewMode', true);
            commit('setReview', { game_id: id, comment: '', star: 3 });
            commit('setReviewStatus', dataStatus.ACCESSIBLE);
            dispatch('uiSpinner/stop', null, { root: true });
          } else {
            commit('setReview', {});
            dispatch('errors/setServerErrors',
              { stat: err.response.status, errors: err.response.data },
              { root: true });
            commit('setReviewStatus', dataStatus.ERROR);
            dispatch('uiSpinner/stop', null, { root: true });
          }
        }
      );
    },
    registerReview: ({ state, commit, dispatch, rootState }, review) => {
      dispatch('uiSpinner/spin', null, { root: true });
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
          dispatch('uiSpinner/stop', null, { root: true });
          dispatch('uiInfobar/onAction',
            `${rootState.game.game.title} の評価を登録しました`,
            { root: true });
        },
        (err) => {
          commit('setReview', {});
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
          commit('setReviewStatus', dataStatus.ERROR);
          dispatch('uiSpinner/stop', null, { root: true });
        }
      );
    },
  },
};
