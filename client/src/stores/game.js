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
          const edata = err.response.data || [{ level: 'error',  message: 'server error' }];
          const estat = err.response.status;
          edata.forEach((err) => {
            commit('errors/addServerErrors',
              { status: estat, level: err.level, message: err.message },
              { root: true });
          });
          commit('setGame', {});
          commit('setGameStatus', dataStatus.ERROR);
        }
      );
    },
  },
};
