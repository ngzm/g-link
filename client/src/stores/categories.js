export default {
  namespaced: true,

  state: {
    categories: [
      { id: 1, title: 'Action', route: 'action', icon: 'track_changes' },
      { id: 2, title: 'Adventure', route: 'adventure', icon: 'terrain' },
      { id: 3, title: 'Battle', route: 'battle', icon: 'directions_walk' },
      { id: 4, title: 'Shooting', route: 'shooting', icon: 'loupe' },
      { id: 5, title: 'Racing', route: 'racing', icon: 'directions_car' },
      { id: 6, title: 'Sports', route: 'sports', icon: 'pool' },
      { id: 7, title: 'Fancy', route: 'fancy', icon: 'face' },
      { id: 8, title: 'Jewels', route: 'jewels', icon: 'blur_on' },
      { id: 9, title: 'Puzzle', route: 'puzzle', icon: 'dashboard' },
      { id: 10, title: 'Brain', route: 'brain', icon: 'wb_incandescent' },
      { id: 11, title: 'Table', route: 'table', icon: 'grid_on' },
      { id: 12, title: 'Variety', route: 'variety', icon: 'games' },
    ],
    sortKeys: [
      { id: 1, title: '新着順', icon: 'update' },
      { id: 2, title: '評価順', icon: 'star' },
      { id: 3, title: 'ｱｸｾｽ順', icon: 'trending_up' },
    ],
    currentCategory: 1,
    currentSortKey: 1,
  },

  getters: {
    getCategories: (state) => (state.categories.slice().sort((a, b) => a.id - b.id)),
    getCurCategory: (state) => {
      const match = state.categories.find((c) => (c.id === state.currentCategory));
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
    setCurCategory: (state, category) => {
      state.currentCategory = category;
    },
    setCurSortKey: (state, sortkey) => {
      state.currentSortKey = sortkey;
    },
  },
};
