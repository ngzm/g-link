<template>
  <v-card class="grey darken-2 white--text" flat>
    <v-card-media v-bind:src="game.iconUri" height="200px">
      <a class="g-grid" href="" @click.stop.prevent="showDetail(game)"></a>
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
/**
 * GameGrid Component
 */
export default {
  props: {
    game: Object,
  },
  methods: {
    showDetail: function(game) {
      this.$router.push(`/game/detail/${game.id}`);
    },
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
