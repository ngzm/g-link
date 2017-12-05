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
      GameService.fetchGameDetail(id,
        (res) => {
          console.log('game');
          console.dir(res.data);
          commit('setGame', res.data);
          commit('setGameStatus', dataStatus.ACCCESSIBLE);
        },
        (err) => {
          console.log(`err = ${err}`);
          commit('setGame', {});
          commit('setGameStatus', dataStatus.ERROR);
        }
      );
    },
  },
};
