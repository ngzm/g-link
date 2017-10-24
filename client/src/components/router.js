import Vue from 'vue';
import VueRouter from 'vue-router';
import Main from './Main.vue';
import Game from './Game.vue';
import GameList from './GameList.vue';
import GameDetail from './GameDetail.vue';
import Login from './Login.vue';

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Main },
  { path: '/game', component: Game,
    children: [
      { path: '', component: GameList },
      { path: 'list/:category', component: GameList },
      { path: 'detail/:id', component: GameDetail, props: true },
    ],
  },
  { path: '/login', component: Login },
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
