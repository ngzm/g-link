<template>
  <!-- Toolbar -->
  <v-toolbar class="indigo darken-4" dark fixed>

    <!-- Left Menu -->
    <v-toolbar-title>
      <v-toolbar-side-icon @click.stop="toggleDrawer"></v-toolbar-side-icon>
      <a class="main-title" @click.stop.prevent="$router.push('/cview')" href="">webgames.link</a>
    </v-toolbar-title>

    <v-spacer></v-spacer>

    <!-- Right Menu -->
    <AppUserMenu :user="user" @logout="signOutAction" v-if="authenticated" />
    <AppRightMenu :auth="authenticated" @login="login" />
  </v-toolbar>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import AppUserMenu from './AppUserMenu.vue';
import AppRightMenu from './AppRightMenu.vue';
import Authenticate from '../libs/authenticate';

const { mapState, mapActions } = createNamespacedHelpers('user');

export default {
  props: {
    toggleDrawer: {
      type: Function,
    },
  },
  computed: {
    ...mapState([
      'user',
      'authenticated',
    ]),
  },
  methods: {
    login: function() {
      Authenticate.clearAllStorage();
      Authenticate.setClientToken();
      window.location.href = Authenticate.getAuthUri();
    },
    ...mapActions([
      'signOutAction',
    ]),
  },
  components: {
    AppUserMenu,
    AppRightMenu,
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
