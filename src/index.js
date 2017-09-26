import Vue from 'vue';
import router from './core/router';
import App from './core/App.vue';
import '../node_modules/vuetify/dist/vuetify.min.css';

new Vue({
  el: '#app',
  template: '<App />',
  components: { App },
  router,
});
