<template>
  <!-- Drawer -->
  <v-navigation-drawer
    persistent
    height="100%"
    light
    clipped
    enable-resize-watcher
    v-model="dopen"
  >
    <!-- Menu Lists -->
    <v-list>

      <v-list-tile exact to="/cview">
        <v-list-tile-action>
          <v-icon>home</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>ホーム</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-list-tile exact to="/cview/ranking">
        <v-list-tile-action>
          <v-icon>new_releases</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>ランキング</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider class="mt-2"></v-divider>

      <!-- Game Categpries -->
      <template v-for="item in categories">
        <v-list-tile exact :key="item.id" :to="`/cview/category/${item.id}`">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>

    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapGetters } = createNamespacedHelpers('categories');

export default {
  props: {
    drawer: {
      type: Boolean,
    },
    setDrawer: {
      type: Function,
    },
  },

  computed: {
    dopen: {
      get: function() {
        return this.drawer;
      },
      set: function(drawer) {
        this.setDrawer(drawer);
      },
    },
    ...mapGetters({ categories: 'getCategories' }),
  },
};
</script>

<style>
</style>
