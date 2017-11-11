import GameService from '../services/GameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    game: {},
    gameStatus: dataStatus.INITIAL,
  },

  getters: {
    getGame: state => state.game,
    getGameStatus: state => state.gameStatus,
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
