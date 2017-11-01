import GameService from '../services/GameService';

export default {
  namespaced: true,

  state: {
    games: [],
    game: null,
    preCategory: 0,
    fetching: false,
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
    getGame: (state) => (state.game),
    isFetching: (state) => (state.fetching),
  },

  mutations: {
    setGames: (state, games) => {
      state.games = games;
    },
    setGame: (state, game) => {
      state.game = game;
    },
    setPreCategory: (state, category) => {
      state.preCategory = category;
    },
    setFetching: (state, status) => {
      state.fetching = status;
    },
  },

  actions: {
    fetchGames: ({ commit, state, rootState }) => {
      const category = rootState.categories.currentCategory;
      if (state.preCategory === category) {
        return;
      }
      // Feching lists of games
      commit('setFetching', true);
      GameService.fetchGames(category,
        (res) => {
          commit('setGames', res.data);
          commit('setPreCategory', category);
          commit('setFetching', false);
        },
        (err) => {
          console.log(`err = ${err}`);
          commit('setFetching', false);
        }
      );
    },
    fetchGame: ({ commit, state }, id) => {
      // Feching game detail
      commit('setFetching', true);
      GameService.fetchGameDetail(id,
        (res) => {
          commit('setGame', res.data);
          commit('setFetching', false);
        },
        (err) => {
          console.log(`err = ${err}`);
          commit('setFetching', false);
        }
      );
    },
  },
};
