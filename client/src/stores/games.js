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
    spliceGames: (state, game) => {
      const idx = state.games.findIndex(g => g.id === game.id);
      if (idx >= 0 && idx < state.games.length) {
        state.games.splice(idx, 1, game);
      }
    },
    setGamesStatus: (state, stt) => {
      state.gamesStatus = stt;
    },
  },

  actions: {
    fetchGames: ({ dispatch, commit, rootState }) => {
      commit('setGamesStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGames(rootState.categories.currentCategory,
        (res) => {
          commit('setGames', res.data);
          dispatch('sortGames');
          commit('setGamesStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          commit('errors/addServerErrors',
            { status: err.response.status, code: err.response.status, message: err.message },
            { root: true }
          );
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
