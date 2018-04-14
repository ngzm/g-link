<template>
  <v-container grid-list-lg>
    <h5 class="headline">{{ title }}</h5>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in games" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" v-on:onSelect="onSelectGame(game.id)" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import GameGrid from './GameGrid.vue';

/**
 * GameList Component
 */
export default {
  props: {
    title: { type: String },
    games: { type: Array },
  },
  methods: {
    onSelectGame: function(gid) {
      this.$emit('onSelect', gid);
    },
  },
  components: {
    GameGrid,
  },
};
</script>

<style>
</style>
