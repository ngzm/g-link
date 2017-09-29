<template>
  <!-- Menu Lists -->
  <v-list dense>

    <!-- Home -->
    <!-- TODO: move to toolbar later -->
    <v-list-tile exact to="/">
      <v-list-tile-action>
        <v-icon>home</v-icon>
      </v-list-tile-action>
      <v-list-tile-content>
        <v-list-tile-title>Home</v-list-tile-title>
      </v-list-tile-content>
    </v-list-tile>

    <!-- Game Categpries -->
    <template v-for="item in listItems">
      <v-list-tile exact :key="item.id" @click="fetchList(item.id)" :to="`/${item.route}`">
        <v-list-tile-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </template>
  </v-list>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex';

export default {
  computed: {
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
