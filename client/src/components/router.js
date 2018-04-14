import Vue from 'vue';
import VueRouter from 'vue-router';
import AppMain from './AppMain.vue';
import Home from './home/Home.vue';
import Ranking from './rank//Ranking.vue';
import Games from './game//Games.vue';
import Game from './game/Game.vue';
import Account from './info//Account.vue';
import Contact from './info//Contact.vue';
import Information from './info//Information.vue';
import Error from './error/Error.vue';

Vue.use(VueRouter);

const routes = [
  { path: '/cview', component: AppMain,
    children: [
      { path: '', component: Home },
      { path: 'ranking', component: Ranking },
      { path: 'category/:cid', component: Games, props: true },
      { path: 'category/:cid/game/:gid', component: Game, props: true },
      { path: 'account', component: Account },
      { path: 'contact', component: Contact },
      { path: 'information', component: Information },
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
