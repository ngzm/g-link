import RankingService from '../services/RankingService';
import { dataStatus } from './StoreStatus';

export default {
  namespaced: true,

  state: {
    updates: [],
    stars: [],
    accesses: [],
    rankingStatus: dataStatus.INITIAL,
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
    setRankingStatus: (state, stt) => {
      state.rankingStatus = stt;
    },
  },

  actions: {
    fetchRanking: ({ commit, dispatch }, fetchSize) => {
      commit('setRankingStatus', dataStatus.BUZY);
      commit('errors/clearServerErrors', null, { root: true });
      RankingService.fetchRanking(fetchSize,
        (res) => {
          console.dir(res.data);

          commit('setRanking', res.data);
          commit('setRankingStatus', dataStatus.ACCESSIBLE);
        },
        (err) => {
          commit('clearRanking');
          commit('setRankingStatus', dataStatus.ERROR);
          dispatch('errors/setServerErrors',
            { stat: err.response.status, errors: err.response.data },
            { root: true });
        }
      );
    },
  },
};
