<template>
  <v-card class="grey darken-2 white--text" flat>
    <v-card-media v-bind:src="game.img" height="200px">
      <a class="g-grid" href="" @click.stop.prevent="showDetail(game.id)"></a>
    </v-card-media>
    <v-card-actions>
      <span>{{ game.title }}</span>
      <v-spacer></v-spacer>
      <span class="access">{{ game.access }}</span>
      /
      <span>
        <v-icon v-for="n in game.star" :key="n" class="yellow--text star" >
          star
        </v-icon>
      </span>
    </v-card-actions>
  </v-card>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapActions } = createNamespacedHelpers('game');

/**
 * GameGrid Component
 */
export default {
  props: {
    game: Object,
  },
  methods: {
    showDetail: function(id) {
      this.fetchGame(id);
      this.$router.push(`/game/detail/${id}`);
    },
    ...mapActions([
      'fetchGame',
    ]),
  },
};
</script>

<style>
a.g-grid {
  display: block;
  width: 100%;
  padding: 4px;
}
.access {
  font-size: 75%;
  color: yellow;
}
.star {
  font-size: 75%;
}
</style>
