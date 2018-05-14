import Vue from 'vue';
import router from './components/router';
import store from './stores';
import App from './components/App.vue';
import '../node_modules/vuetify/dist/vuetify.min.css';

new Vue({
  el: '#app',
  components: { App },
  render: h => h('App'),
  router,
  store,
});
