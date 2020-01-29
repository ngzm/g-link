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
      <v-list-item
        to="/cview"
        exact
      >
        <v-list-item-action>
          <v-icon>home</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>ホーム</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item
        to="/cview/ranking"
        exact
      >
        <v-list-item-action>
          <v-icon>new_releases</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>ランキング</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider class="mt-2" />

      <!-- Game Categpries -->
      <template v-for="item in categories">
        <v-list-item
          :key="item.id"
          :to="`/cview/category/${item.id}`"
          exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
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
