<template>
  <section>
    <GameList :category="category" />
  </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import GameList from './GameList.vue';

const { mapActions } = createNamespacedHelpers('games');

/**
 * Game Component
 */
export default {
  props: {
    category: String,
  },

  methods: {
    ...mapActions([
      'fetchGames',
    ]),
  },

  components: {
    GameList,
  },

  beforeMount: function() {
    this.fetchGames(this.category);
  },

  beforeUpdate: function() {
    this.fetchGames(this.category);
  },
};
</script>

<style>
</style>
