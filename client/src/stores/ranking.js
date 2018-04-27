import RankingService from '../services/rankingService';

export default {
  namespaced: true,

  state: {
    updates: [],
    stars: [],
    accesses: [],
  },

  mutations: {
    setRanking: (state, ranking) => {
      state.updates = ranking.updates;
      state.stars = ranking.stars;
      state.accesses = ranking.accesses;
    },
    clearRanking: (state) => {
      state.updates = [];
      state.stars = [];
      state.accesses = [];
    },
  },

  actions: {
    fetchRanking: ({ commit, dispatch }, fetchSize) => {
      commit('errors/clearServerErrors', null, { root: true });
      RankingService.fetchRanking(fetchSize,
        (res) => {
          commit('setRanking', res.data);
        },
        (err) => {
          commit('clearRanking');
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
  },
};
