const idcomp = (a, b) => (
  (a.id === b.id) ? 0 : ((a.id > b.id) ? 1 : -1)
);

export default {
  namespaced: true,

  state: {
    // 本来はDBからデータを取得する
    categories: [
      { id: 1, title: 'Action', route: 'action', icon: 'home' },
      { id: 2, title: 'Adventure', route: 'adventure', icon: 'history' },
      { id: 3, title: 'Racing', route: 'racing', icon: 'featured_play_list' },
      { id: 4, title: 'Shooting', route: 'shooting', icon: 'trending_up' },
      { id: 5, title: 'Battle', route: 'battle', icon: 'home' },
      { id: 6, title: 'Sports', route: 'sports', icon: 'history' },
      { id: 7, title: 'Fancy', route: 'fancy', icon: 'featured_play_list' },
      { id: 8, title: 'Puzzle', route: 'puzzle', icon: 'trending_up' },
      { id: 9, title: 'Jewels', route: 'jewels', icon: 'home' },
      { id: 10, title: 'Brain', route: 'brain', icon: 'history' },
      { id: 11, title: 'Table', route: 'table', icon: 'trending_up' },
      { id: 12, title: 'Variety', route: 'variety', icon: 'featured_play_list' },
    ],

    // 本来はDBからデータを取得する
    sortKeys: [
      { id: 1, title: 'Updates', icon: 'history' },
      { id: 2, title: 'Stars', icon: 'history' },
      { id: 3, title: 'Access', icon: 'history' },
    ],
    currentCategory: 1,
    currentSortKey: 1,
  },

  getters: {
    getCategories: (state) => (state.categories.slice().sort(idcomp)),
    getSortKeys: (state) => (state.sortKeys.slice().sort(idcomp)),
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
