<template>
  <v-container grid-list-lg>
    <v-layout row wrap>
      <v-flex xs12 sm6>
        <h3>{{ categoryTitle }}</h3>
      </v-flex>
      <v-flex xs12 sm6 class="text-xs-left text-sm-right mt-2">
        <v-btn-toggle mandatory v-model="sortButton">
          <v-btn flat  v-for="key in getSortKeys" :key="key.id">
            {{key.title}}
          </v-btn>
        </v-btn-toggle>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in getGames" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
import GameGrid from './GameGrid.vue';

/**
 * GameList Component
 */
export default {
  props: {
    categoryTitle: String,
  },
  data() {
    return {
      sortButton: 0,
    };
  },
  computed: {
    ...mapGetters('games', [
      'getGames',
    ]),
    ...mapGetters('categories', [
      'getSortKeys',
    ]),
  },
  components: {
    GameGrid,
  },
};
</script>

<style>
</style>
