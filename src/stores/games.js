import { GameService } from '../services/gameService';

export default {
  namespaced: true,

  state: {
    games: [],
  },

  getters: {
    getGames: (state) => (sortKey = 1) => {
      const glist = state.games.slice();

      switch (sortKey) {
      case 1:
        return glist.sort(GameService.compStar);

      case 2:
        return glist.sort(GameService.compAccess);

      default:
        return glist.sort(GameService.compStar);
      }
    },
    getGameById: (state) => (id) => (
      state.games.find(game => game.id === id)
    ),
  },

  mutations: {
    setGames: (state, games) => {
      state.games = games;
    },
  },

  actions: {
    fetchGames: (context, category) => {
      GameService.fetchGames(category,
        (res) => {
          console.log('res');
          console.dir(res.data);
          context.commit('setGames', res.data); },
        (err) => { console.log(`err = ${err}`); }
      );
    },
  },
};
