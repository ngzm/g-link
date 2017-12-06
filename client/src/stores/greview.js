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
    fetchReview: ({ commit }, id) => {
      commit('setReviewStatus', dataStatus.BUZY);
      GameService.fetchGameReview(id,
        (res) => {
          commit('setReview', res.data);
          commit('setNewMode', false);
          commit('setReviewStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          console.log(`err status = ${err.response.status}`);
          console.log(`err message = ${err.message}`);
          if (err.response.status == 404) {
            commit('setNewMode', true);
            commit('setReview', { game_id: id, comment: '', star: 3 });
            commit('setReviewStatus', dataStatus.ACCESSIBLE);
          } else {
            commit('setReview', {});
            commit('setReviewStatus', dataStatus.ERROR);
          }
        }
      );
    },
    registerReview: ({ state, commit }, review) => {
      commit('setReviewStatus', dataStatus.BUZY);

      let func = null;
      if (state.newMode) {
        func = GameService.createGameReview;
      } else {
        func = GameService.updateGameReview;
      }
      func.call(GameService, Object.assign(state.review, review),
        (res) => {
          commit('setReview', {});
          const gdat = res.data;

          // Set game datato the game store
          commit('game/setGame', gdat, { root: true });

          // Splice game data to the games store
          commit('games/spliceGames', gdat, { root: true });

          commit('setNewMode', false);
          commit('setReviewStatus', dataStatus.REGISTERED);
        },
        (err) => {
          console.log(`err status = ${err.response.status}`);
          console.log(`err message = ${err.message}`);
          commit('setReview', {});
          commit('setReviewStatus', dataStatus.ERROR);
        }
      );
    },
  },
};
