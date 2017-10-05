<template>
  <v-container grid-list-lg>
    <h3>{{ getCurCategory.title }}</h3>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in getGames" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" />
      </v-flex>
    </v-layout>
    <SortFb />
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
import GameGrid from './GameGrid.vue';
import SortFb from './SortFb.vue';

/**
 * GameList Component
 */
export default {
  computed: {
    ...mapGetters('games', [
      'getGames',
    ]),
    ...mapGetters('categories', [
      'getCurCategory',
    ]),
  },
  components: {
    GameGrid,
    SortFb,
  },
};
</script>

<style>
</style>
