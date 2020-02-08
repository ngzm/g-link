<template>
  <v-container grid-list-lg>
    <v-row>
      <v-col
        clos="12"
      >
        <h5 class="headline">{{ title }}</h5>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        v-for="game in games"
        :key="game.id"
        cols="12"
        sm="6"
        md="4"
        lg="3"
        xl="2"
      >
        <GameGrid
          :game="game"
          @onSelect="onSelectGame(game.id)"
        />
      </v-col>
    </v-row>
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
