import GameService from '../services/GameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    games: [],
    gamesStatus: dataStatus.INITIAL,
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
    fetchGames: ({ dispatch, commit, rootState }) => {
      commit('setGamesStatus', dataStatus.BUZY);
      GameService.fetchGames(rootState.categories.currentCategory,
        (res) => {
          console.log('data'); console.dir(res.data);
          commit('setGames', res.data);
          dispatch('sortGames');
          commit('setGamesStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          console.log(`err = ${err}`);
          commit('setGames', []);
          commit('setGamesStatus', dataStatus.ERROR);
        }
      );
    },
    sortGames: ({ state, commit, rootState }) => {
      let func;
      const key = rootState.categories.currentSortKey;
      switch (key) {
      case 2:
        func = (a, b) => (b.star - a.star);
        break;
      case 3:
        func = (a, b) => (b.access - a.access);
        break;
      case 1:
      default:
        func = (a, b) => {
          const adate = new Date(a.created_at);
          const bdate = new Date(b.created_at);
          return bdate - adate;
        };
        break;
      }
      commit('setGames', state.games.slice().sort(func));
    },
  },
};
