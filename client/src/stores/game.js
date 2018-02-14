import GameService from '../services/GameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    game: {},
    gameStatus: dataStatus.INITIAL,
  },

  mutations: {
    setGame: (state, game) => {
      state.game = game;
    },
    setGameStatus: (state, stt) => {
      state.gameStatus = stt;
    },
  },

  actions: {
    fetchGame: ({ commit, dispatch }, id) => {
      commit('setGame', {});
      commit('setGameStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGameDetail(id,
        (res) => {
          commit('setGame', res.data);
          commit('games/spliceGames', res.data, { root: true });
          commit('setGameStatus', dataStatus.ACCCESSIBLE);
        },
        (err) => {
          commit('setGame', {});
          commit('setGameStatus', dataStatus.ERROR);
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
  },
};
