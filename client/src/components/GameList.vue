<template>
  <v-container grid-list-lg>
    <h3>{{ getCurCategory.title }}</h3>

    <!-- alerts -->
    <AlertField v-bind:alerts="serverErrors" />

    <!-- Games -->
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in games" :key="game.id">
        <!-- GameGrid -->
        <GameGrid v-bind:game="game" v-on:onSelect="onSelectGame(game.id)" />
      </v-flex>
    </v-layout>

    <!-- Floating action buttons for sorting the games list -->
    <SortFb />

  </v-container>
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
import GameGrid from './GameGrid.vue';
import AlertField from './AlertField.vue';
import SortFb from './SortFb.vue';

/**
 * GameList Component
 */
export default {
  computed: {
    ...mapState('games', [
      'games',
    ]),
    ...mapState('errors', [
      'serverErrors',
    ]),
    ...mapGetters('categories', [
      'getCurCategory',
    ]),
  },
  methods: {
    onSelectGame: function(id) {
      this.$router.push(`/game/detail/${id}`);
    },
    ...mapMutations('categories', [
      'setCurCategoryByRoute',
    ]),
    ...mapActions('games', [
      'fetchGames',
    ]),
  },
  components: {
    GameGrid,
    AlertField,
    SortFb,
  },
  beforeRouteEnter (to, from, next) {
    next(vm => {
      vm.setCurCategoryByRoute(to.params.category);
      vm.fetchGames();
    });
  },
  beforeRouteUpdate (to, from, next) {
    this.setCurCategoryByRoute(to.params.category);
    this.fetchGames();
    next();
  },
};
</script>

<style>
</style>
