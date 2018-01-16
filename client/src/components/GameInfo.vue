<template>
  <v-card>
    <v-card-media :src="game.img" height="340px">
    </v-card-media>

    <v-card-actions>
      <v-btn block dark class="red darken-4" @click="$emit('onReview')" >
        やってみる
        <v-icon>play_arrow</v-icon>
      </v-btn>
    </v-card-actions>

    <v-card-title primary-title>
      <div>
        <h5 class="title">{{ game.title }}</h5>
        <div>{{ game.description }}</div>
      </div>
    </v-card-title>

    <v-card-text>
      <div>
        <h5 class="title">遊び方</h5>
        <ol>
          <li v-for="(is, index) in game.instructions" :key="index">
            {{ is.explanation }}
          </li>
        </ol>
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
/**
 * Game Information Component
 */
export default {
  props: {
    game: {
      type: Object,
    },
  },
};
</script>

<style>
</style>
