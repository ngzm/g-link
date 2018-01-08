import Vue from 'vue';
import VueRouter from 'vue-router';
import AppMain from './AppMain.vue';
import Home from './Home.vue';
import Game from './Game.vue';
import GameList from './GameList.vue';
import GameDetail from './GameDetail.vue';
// NO USE !!!!! import Login from './Login.vue';
import Error from './Error.vue';

Vue.use(VueRouter);

const routes = [
  { path: '/cview', component: AppMain,
    children: [
      { path: '', component: Home },
      { path: 'category/:cid', component: Game,
        children: [
          { path: '', component: GameList, props: true },
          { path: 'game/:gid', component: GameDetail, props: true },
        ],
      },
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
