<template>
  <v-container grid-list-lg>
    <h3>{{ category }}</h3>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in getGames(1)" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import GameGrid from './GameGrid.vue';

const { mapGetters } = createNamespacedHelpers('games');

/**
 * GameList Component
 */
export default {
  props: {
    category: String,
  },

  computed: {
    ...mapGetters([
      'getGames',
    ]),
  },

  components: {
    GameGrid,
  },
};
</script>

<style>
</style>
