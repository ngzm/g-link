import Vue from 'vue';
import VueRouter from 'vue-router';

import Game from '../game/Game.vue';
import Login from '../auth/Login.vue';
import { gamesCategories } from '../game/define_items.js';

Vue.use(VueRouter);

const routes = [
  { path: '/:category', component: Game },
  { path: '/login', component: Login },
];
export default new VueRouter({ routes });

export const menuCategoryItems = gamesCategories.map(c => ({
  to: `/:${c.id}`,
  ...c,
}));
