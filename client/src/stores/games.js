import GameService from '../services/GameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    games: [],
    gamesStatus: dataStatus.INITIAL,
  },

  getters: {
    getGames: (state, getters, rootState) => {
      const key = rootState.categories.currentSortKey;
      let comp;
      if (key === 2) {
        comp = (a, b) => ((a.star === b.star) ? 0 : ((a.star < b.star) ? 1 : -1));
      } else if (key === 3) {
        comp = (a, b) => ((a.access === b.access) ? 0 : ((a.access < b.access) ? 1 : -1));
      } else {
        comp = (a, b) => ((a.star === b.star) ? 0 : ((a.star < b.star) ? 1 : -1));
      }
      return state.games.slice().sort(comp);
    },
    getGameById: (state) => (id) => (state.games.find(game => game.id === id)),
    getGamesStatus: state => state.gamesStatus,
  },

  mutations: {
    setGames: (state, games) => {
      state.games = games;
    },
    setGamesStatus: (state, stt) => {
      state.gamesStatus = stt;
    },
  },

  actions: {
    fetchGames: ({ commit, rootState }) => {
      commit('setGamesStatus', dataStatus.BUZY);
      GameService.fetchGames(rootState.categories.currentCategory,
        (res) => {
          commit('setGames', res.data);
          commit('setGamesStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          console.log(`err = ${err}`);
          commit('setGames', []);
          commit('setGamesStatus', dataStatus.ERROR);
        }
      );
    },
  },
};
