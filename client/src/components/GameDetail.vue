<template>
  <v-container fluid grid-list-xl>
    <v-layout row wrap>
      <v-flex sm8 md6 lg6 xl6 offset-sm2 offset-md0>
        <!-- Game information -->
        <GameInfo :game="game" />
      </v-flex>
      <v-flex sm8 md6 lg6 xl6 offset-sm2 offset-md0>
        <!-- Game extra information -->
        <GameInfoExtra :game="game" />
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
