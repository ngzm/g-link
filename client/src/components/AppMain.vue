<template>
  <v-app>
    <!-- Drawer -->
    <AppDrawer
      :drawer="drawer"
      :set-drawer="setDrawer"
    />

    <!-- Toolbar -->
    <AppToolbar :toggle-drawer="toggleDrawer" />

    <!-- Main Contents -->
    <v-content>
      <!-- Alerts -->
      <AlertField :alerts="serverErrors" />

      <!-- Each contents -->
      <router-view />
    </v-content>

    <!-- Spinner -->
    <Spinner />

    <!-- Inforbar -->
    <Infobar />
  </v-app>
</template>

<script>
import { mapState } from 'vuex';
import AppDrawer from './AppDrawer.vue';
import AppToolbar from './AppToolbar.vue';
import AlertField from './util/AlertField.vue';
import Infobar from './util/Infobar.vue';
import Spinner from './util/Spinner.vue';

export default {
  components: {
    AppDrawer,
    AppToolbar,
    AlertField,
    Infobar,
    Spinner,
  },
  data() {
    return {
      drawer: null,
    };
  },
  computed: {
    ...mapState('user', [
      'user',
      'authenticated',
    ]),
    ...mapState('errors', [
      'serverErrors',
    ]),
  },
  methods: {
    setDrawer: function(flg) {
      this.drawer = flg;
    },
    toggleDrawer: function() {
      this.drawer = !this.drawer;
    },
  },
};
</script>

<style>
</style>
