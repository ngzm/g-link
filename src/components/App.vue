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

      <!-- Left Menu -->
      <v-toolbar-title>
        <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
        <a class="main-title" @click.stop.prevent="$router.push('/')" href="">webgames.link</a>
      </v-toolbar-title>

      <v-spacer></v-spacer>

      <!-- Right Menu -->
      <v-menu bottom left>
        <v-btn icon slot="activator" dark>
          <v-icon>more_vert</v-icon>
        </v-btn>
        <v-list dense>
          <v-list-tile @click="">
            <v-list-tile-content>
              <v-list-tile-title>検索</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-icon>search</v-icon>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile @click="">
            <v-list-tile-content>
              <v-list-tile-title>ログイン</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-icon>person_outline</v-icon>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile @click="">
            <v-list-tile-content>
              <v-list-tile-title>アカウント管理</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-icon>account_box</v-icon>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile @click="">
            <v-list-tile-content>
              <v-list-tile-title>サイト情報</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-icon>info</v-icon>
            </v-list-tile-action>
          </v-list-tile>

        </v-list>
      </v-menu>

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
import SideMenu from './SideMenu.vue';

Vue.use(Vuetify);

export default {
  data() {
    return {
      drawer: true,
    };
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
a.main-title { color: #fff; text-decoration: none; }
a.main-title:link { color: #fff; }
a.main-title:visited { color: #fff; }
a.main-title:hover { color: #fff; }
a.main-title:active { color: #fff; }
</style>
