<template>
  <!-- Drawer -->
  <v-navigation-drawer
    v-model="dopen"
    fixed
    clipped
    app
  >
    <!-- Menu Lists -->
    <v-list>
      <v-list-tile
        to="/cview"
        exact
      >
        <v-list-tile-action>
          <v-icon>home</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>ホーム</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
      <v-list-tile
        to="/cview/ranking"
        exact
      >
        <v-list-tile-action>
          <v-icon>new_releases</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>ランキング</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider class="mt-2" />

      <!-- Game Categpries -->
      <template v-for="item in categories">
        <v-list-tile
          :key="item.id"
          :to="`/cview/category/${item.id}`"
          exact
        >
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
      default: null,
      type: Boolean,
    },
    setDrawer: {
      required: true,
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
