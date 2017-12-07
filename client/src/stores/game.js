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
    fetchGame: ({ commit }, id) => {
      commit('setGameStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGameDetail(id,
        (res) => {
          commit('setGame', res.data);
          commit('setGameStatus', dataStatus.ACCCESSIBLE);
        },
        (err) => {
          commit('errors/addServerErrors',
            { status: err.response.status, code: err.response.status, message: err.message },
            { root: true }
          );
          commit('setGame', {});
          commit('setGameStatus', dataStatus.ERROR);
        }
      );
    },
  },
};
