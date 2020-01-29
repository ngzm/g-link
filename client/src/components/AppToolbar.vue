<template>
  <!-- Toolbar -->
  <v-app-bar
    color="indigo darken-4"
    dark
    fixed
    clipped-left
    app
  >
    <!-- Left Menu -->
    <v-app-bar-nav-icon @click.stop="toggleDrawer" />
    <v-toolbar-title>
      <a
        class="main-title"
        href=""
        @click.stop.prevent="$router.push('/cview')"
      >
        freegame.link
      </a>
    </v-toolbar-title>

    <v-spacer />

    <!-- Right Menu -->
    <AppUserMenu
      v-if="authenticated"
      :user="user"
      @logout="signOutAction"
    />
    <AppRightMenu
      :auth="authenticated"
      @login="login"
      @privacy="privacy"
    />
  </v-app-bar>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import AppUserMenu from './AppUserMenu.vue';
import AppRightMenu from './AppRightMenu.vue';
import Authenticate from '../libs/authenticate';

const { mapState, mapActions } = createNamespacedHelpers('user');

export default {
  components: {
    AppUserMenu,
    AppRightMenu,
  },
  props: {
    toggleDrawer: {
      required: true,
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
    privacy: function() {
      window.open('/appl/information/privacy/', '_blank');
    },
    ...mapActions([
      'signOutAction',
    ]),
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
