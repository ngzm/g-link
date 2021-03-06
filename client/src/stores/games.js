import GameService from '../services/gameService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    games: [],
    gamesStatus: dataStatus.INITIAL,
    lastCid: 0,
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
    setLastCid: (state, cid) => {
      state.lastCid = cid;
    },
  },

  actions: {
    fetchGames: ({ state, commit, dispatch }, cid) => {
      // Do not fetch when it is same with last fetched.
      if (state.lastCid == cid) { return; }

      dispatch('uiSpinner/spin', null, { root: true });
      commit('setLastCid', 0);
      commit('setGames', []);
      commit('setGamesStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      GameService.fetchGames(cid,
        (res) => {
          commit('setGames', res.data);
          commit('setLastCid', cid);
          dispatch('sortGames');
          commit('setGamesStatus', dataStatus.ACCESSIBLE);
          dispatch('uiSpinner/stop', null, { root: true });
        },
        (err) => {
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
          commit('setGamesStatus', dataStatus.ERROR);
          dispatch('uiSpinner/stop', null, { root: true });
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
