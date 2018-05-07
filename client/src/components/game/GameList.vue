<template>
  <v-container grid-list-lg>
    <v-layout row>
      <v-flex xs12>
        <h5 class="headline">{{ title }}</h5>
      </v-flex>
    </v-layout>

    <v-layout
      row
      wrap
    >
      <v-flex
        v-for="game in games"
        :key="game.id"
        xs12
        sm6
        md4
        lg3
        xl2
      >
        <GameGrid
          :game="game"
          @onSelect="onSelectGame(game.id)"
        />
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
  components: {
    GameGrid,
  },
  props: {
    title: {
      default: '',
      type: String,
    },
    games: {
      default: () => [],
      type: Array,
    },
  },
  methods: {
    onSelectGame: function(gid) {
      this.$emit('onSelect', gid);
    },
  },
};
</script>

<style>
</style>
