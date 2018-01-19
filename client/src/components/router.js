import Vue from 'vue';
import VueRouter from 'vue-router';
import AppMain from './AppMain.vue';
import Home from './Home.vue';
import Ranking from './Ranking.vue';
import Games from './Games.vue';
import Game from './Game.vue';
import Error from './Error.vue';

Vue.use(VueRouter);

const routes = [
  { path: '/cview', component: AppMain,
    children: [
      { path: '', component: Home },
      { path: 'ranking', component: Ranking },
      { path: 'category/:cid', component: Games, props: true },
      { path: 'category/:cid/game/:gid', component: Game, props: true },
    ],
  },
  { path: '/cerror', component: Error },
];

const scrollBehavior = (to, from, savedPosition) => {
  if (savedPosition) {
    return savedPosition;
  } else {
    return { x: 0, y: 0 };
  }
};

export default new VueRouter({
  mode: 'history',
  routes,
  scrollBehavior,
});
