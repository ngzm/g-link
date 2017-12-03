<template>
  <v-container grid-list-lg>
    <h3>{{ getCurCategory.title }}</h3>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in games" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" v-on:onSelect="onSelectGame(game.id)" />
      </v-flex>
    </v-layout>
    <SortFb />
  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import GameGrid from './GameGrid.vue';
import SortFb from './SortFb.vue';

const { mapState } = createNamespacedHelpers('games');
const { mapGetters } = createNamespacedHelpers('categories');
const { mapActions } = createNamespacedHelpers('game');

/**
 * GameList Component
 */
export default {
  computed: {
    ...mapState([
      'games',
    ]),
    ...mapGetters([
      'getCurCategory',
    ]),
  },
  methods: {
    onSelectGame: function(id) {
      this.fetchGame(id);
      this.$router.push(`/game/detail/${id}`);
    },
    ...mapActions([
      'fetchGame',
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
