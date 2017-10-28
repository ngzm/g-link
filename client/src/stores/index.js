import Vue from 'vue';
import Vuex from 'vuex';
import games from './games';
import categories from './categories';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    games,
    categories,
  },
});
