import Vue from 'vue';
import router from './components/router';
import store from './stores';
import App from './components/App.vue';
import '../node_modules/vuetify/dist/vuetify.min.css';

new Vue({
  el: '#app',
  template: '<App />',
  components: { App },
  router,
  store,
});
