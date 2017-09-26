import Vue from 'vue';
import Vuetify from 'vuetify';
import App from './components/App.vue';
import '../node_modules/vuetify/dist/vuetify.min.css';

Vue.use(Vuetify);

new Vue({
  el: '#app',
  template: '<App />',
  components: { App },
});
