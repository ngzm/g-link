<template>
  <v-container fluid grid-list-xl>
    <v-layout row wrap class="hidden-sm-and-down">
      <v-flex sm10 md6 lg6 xl5 offset-sm1 offset-md0 mt-0 mb-0 pt-0 pb-0>
        <h5 class="headline">{{ game.title }}</h5>
      </v-flex>
    </v-layout>

    <v-layout row wrap>
      <v-flex sm10 md6 lg6 xl5 offset-sm1 offset-md0>
        <!-- Game information -->
        <GameInfo :game="game" @onPlay="$emit('onPlay')" />
      </v-flex>
      <v-flex sm10 md6 lg6 xl5 offset-sm1 offset-md0>
        <!-- Game extra information -->
        <GameInfoExtra :game="game" @onReview="$emit('onReview')" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import GameInfo from './GameInfo.vue';
import GameInfoExtra from './GameInfoExtra.vue';

/**
 * Game Detail Component
 */
export default {
  props: {
    game: { type: Object, },
  },
  components: {
    GameInfo,
    GameInfoExtra,
  },
};
</script>

<style>
</style>
