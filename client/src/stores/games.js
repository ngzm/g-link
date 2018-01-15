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
    fetchGames: ({ commit, dispatch }, cid) => {
      commit('setGamesStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGames(cid,
        (res) => {
          commit('setGames', res.data);
          dispatch('sortGames');
          commit('setGamesStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          commit('setGames', []);
          commit('setGamesStatus', dataStatus.ERROR);
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
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
