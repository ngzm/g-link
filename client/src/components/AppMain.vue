<template>
  <v-app toolbar>

    <!-- Drawer -->
    <AppDrawer :drawer="drawer" :setDrawer="setDrawer" />

    <!-- Toolbar -->
    <AppToolbar :toggleDrawer="toggleDrawer" />

    <!-- Main Contents -->
    <main>
      <router-view></router-view>
    </main>

    <!-- Inforbar -->
    <Infobar
      :snackbar="snackbar"
      :setSnackbar="setSnackbar"
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
  data() {
    return {
      drawer: true,
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
  components: {
    AppDrawer,
    AppToolbar,
    Infobar,
  },
};
</script>

<style>
</style>
