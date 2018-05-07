<template>
  <v-app toolbar>

    <!-- Drawer -->
    <AppDrawer
      :drawer="drawer"
      :set-drawer="setDrawer"
    />

    <!-- Toolbar -->
    <AppToolbar :toggle-drawer="toggleDrawer" />

    <!-- Main Contents -->
    <v-content>
      <router-view />
    </v-content>

    <!-- Inforbar -->
    <Infobar
      :snackbar="snackbar"
      :set-snackbar="setSnackbar"
      :message="message"
    />
  </v-app>
</template>

<script>
import { mapState } from 'vuex';
import AppDrawer from './AppDrawer.vue';
import AppToolbar from './AppToolbar.vue';
import Infobar from './util/Infobar.vue';

export default {
  components: {
    AppDrawer,
    AppToolbar,
    Infobar,
  },
  data() {
    return {
      drawer: null,
      snackbar: false,
      message: '',
    };
  },
  computed: {
    ...mapState('user', [
      'user',
      'authenticated',
    ]),
  },
  watch: {
    authenticated: function(value) {
      if (value) {
        this.message = `ようこそ ${this.user.name} さん`;
      } else {
        this.message = 'ログアウトしました';
      }
      this.snackbar = true;
    },
  },
  methods: {
    setDrawer: function(flg) {
      this.drawer = flg;
    },
    toggleDrawer: function() {
      this.drawer = !this.drawer;
    },
    setSnackbar: function(flg) {
      this.snackbar = flg;
    },
  },
};
</script>

<style>
</style>
