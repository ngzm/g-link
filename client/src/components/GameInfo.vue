<template>
  <v-card>
    <!-- Game title and description -->
    <v-card-media :src="game.img" height="340px">
    </v-card-media>
    <v-card-title primary-title>
      <div>
        <h3 class="headline mb-0">{{ game.title }}</h3>
        <div>{{ game.description }}</div>
      </div>
    </v-card-title>

    <!-- Game instructions -->
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
