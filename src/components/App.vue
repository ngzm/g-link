<template>
  <v-app toolbar>

    <!-- Drawer -->
    <v-navigation-drawer
      class="pt-2"
      persistent
      height="100%"
      light
      clipped
      enable-resize-watcher
      v-model="drawer"
    >
      <!-- Side Menu -->
      <SideMenu />
    </v-navigation-drawer>

    <!-- Toolbar -->
    <v-toolbar class="indigo" dark fixed>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Toolbar</v-toolbar-title>
      <v-spacer></v-spacer>

      <v-btn-toggle mandatory v-model="sortButton">
        <v-btn primary dark v-for="key in getSortKeys" :key="key.id">
          {{key.title}}
        </v-btn>
      </v-btn-toggle>

    </v-toolbar>

    <!-- Main Contents -->
    <main>
      <router-view></router-view>
    </main>

  </v-app>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import { mapGetters } from 'vuex';
import SideMenu from './SideMenu.vue';

Vue.use(Vuetify);

export default {
  data() {
    return {
      drawer: true,
      sortButton: 0,
    };
  },
  computed: {
    ...mapGetters('categories', [
      'getSortKeys',
    ]),
  },
  components: {
    SideMenu,
  },
  created: function() {
    this.$router.push('/');
  },
};
</script>

<style>
</style>
