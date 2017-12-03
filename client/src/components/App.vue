<template>
  <v-app toolbar>

    <!-- Drawer -->
    <AppDrawer v-bind:drawer="drawer" v-bind:setDrawer="setDrawer" />

    <!-- Toolbar -->
    <AppToolbar @toggleDrawer="toggleDrawer" />

    <!-- Main Contents -->
    <main>
      <router-view></router-view>
    </main>

  </v-app>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import AppDrawer from './AppDrawer.vue';
import AppToolbar from './AppToolbar.vue';

Vue.use(Vuetify);

export default {
  data() {
    return {
      drawer: true,
    };
  },
  methods: {
    setDrawer: function(flg) {
      this.drawer = flg;
    },
    toggleDrawer: function() {
      this.drawer = !this.drawer;
    },
  },
  components: {
    AppDrawer,
    AppToolbar,
  },
  created: function() {
    this.$router.push('/');
  },
};
</script>

<style>
</style>
