import Vue from 'vue';
import VueRouter from 'vue-router';

import Main from './Main.vue';
import Game from './Game.vue';
import Login from './Login.vue';
import { gamesCategories } from '../services/gameService';

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Main },
  { path: '/:category', component: Game, props: true },
  { path: '/login', component: Login },
];
export default new VueRouter({ routes });

export const menuCategoryItems = gamesCategories.map(c => ({
  to: `/${c.route}`,
  ...c,
}));
