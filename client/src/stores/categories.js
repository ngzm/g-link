export default {
  namespaced: true,

  state: {
    categories: [
      { id: 1, title: 'Action',  icon: 'track_changes' },
      { id: 2, title: 'Adventure', icon: 'terrain' },
      { id: 3, title: 'Battle', icon: 'directions_walk' },
      { id: 4, title: 'Shooting', icon: 'loupe' },
      { id: 5, title: 'Racing', icon: 'directions_car' },
      { id: 6, title: 'Sports', icon: 'pool' },
      { id: 7, title: 'Fancy', icon: 'face' },
      { id: 8, title: 'Jewels', icon: 'blur_on' },
      { id: 9, title: 'Puzzle', icon: 'dashboard' },
      { id: 10, title: 'Brain', icon: 'wb_incandescent' },
      { id: 11, title: 'Table', icon: 'grid_on' },
      { id: 12, title: 'Variety', icon: 'games' },
    ],
    sortKeys: [
      { id: 1, title: '新着順', icon: 'update' },
      { id: 2, title: '評価順', icon: 'star' },
      { id: 3, title: 'ｱｸｾｽ順', icon: 'trending_up' },
    ],
    currentSortKey: 1,
  },

  getters: {
    getCategories: (state) => (state.categories.slice().sort((a, b) => a.id - b.id)),
    getCurCategory: (state) => (cid) => {
      const match = state.categories.find((c) => (c.id === cid));
      if (!match) { return state.categories[0]; }
      return match;
    },
    getSortKeys: (state) => (state.sortKeys.slice().sort((a, b) => a.id - b.id)),
    getCurSortKey: (state) => {
      const match = state.sortKeys.find((k) => (k.id === state.currentSortKey));
      if (!match) { return state.sortKeys[0]; }
      return match;
    },
  },

  mutations: {
    setCurSortKey: (state, sortkey) => {
      state.currentSortKey = sortkey;
    },
  },
};
