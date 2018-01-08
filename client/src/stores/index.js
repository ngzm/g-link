import Vue from 'vue';
import Vuex from 'vuex';
import games from './games';
import game from './game';
import greview from './greview';
import categories from './categories';
import user from './user';
import errors from './errors';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    games,
    game,
    greview,
    categories,
    user,
    errors,
  },
});
