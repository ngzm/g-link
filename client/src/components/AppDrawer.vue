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

      <v-list-tile exact to="/">
        <v-list-tile-action>
          <v-icon>home</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>ホーム</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-list-tile exact to="/top-ten">
        <v-list-tile-action>
          <v-icon>new_releases</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>オススメ</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider class="mt-2"></v-divider>

      <!-- Game Categpries -->
      <template v-for="item in listItems">
        <v-list-tile exact :key="item.id" @click="fetchList(item.id)" :to="`/game/list/${item.route}`">
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
import { mapGetters, mapMutations, mapActions } from 'vuex';

export default {
  props: {
    drawer: {
      type: Boolean,
    },
  },

  computed: {
    dopen: {
      get: function() {
        return this.drawer;
      },
      set: function(isopn) {
        this.$emit('setDrawer', isopn);
      },
    },
    ...mapGetters('categories', {
      listItems: 'getCategories',
    }),
  },

  methods: {
    fetchList: function(id) {
      this.setCurCategory(id);
      this.fetchGames();
    },
    ...mapMutations('categories', [
      'setCurCategory',
    ]),
    ...mapActions('games', [
      'fetchGames',
    ]),
  },
};
</script>

<style>
</style>
