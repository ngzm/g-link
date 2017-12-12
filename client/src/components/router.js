import Vue from 'vue';
import VueRouter from 'vue-router';
import AppMain from './AppMain.vue';
import Home from './Home.vue';
import Game from './Game.vue';
import GameList from './GameList.vue';
import GameDetail from './GameDetail.vue';
import Login from './Login.vue';
import Error from './Error.vue';

Vue.use(VueRouter);

const routes = [
  { path: '/', component: AppMain,
    children: [
      { path: '', component: Home },
      { path: 'home', component: Home },
      { path: 'game', component: Game,
        children: [
          { path: '', component: GameList },
          { path: 'list/:category', component: GameList },
          { path: 'detail/:id', component: GameDetail, props: true },
        ],
      },
      { path: 'login', component: Login },
    ],
  },
  { path: '/error', component: Error },
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
