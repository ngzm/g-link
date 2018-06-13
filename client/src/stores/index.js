import Vue from 'vue';
import Vuex from 'vuex';
import errors from './errors';
import categories from './categories';
import user from './user';
import games from './games';
import game from './game';
import greview from './greview';
import ranking from './ranking';
import advertise from './advertise';
import info from './info';
import uiInfobar from './uiInfobar';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    errors,
    categories,
    user,
    games,
    game,
    greview,
    ranking,
    advertise,
    info,
    uiInfobar,
  },
});
