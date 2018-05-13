<template>
  <v-container
    fluid
    grid-list-xl
  >
    <v-layout
      class="hidden-sm-and-down"
      row
    >
      <v-flex
        sm10
        md6
        lg6
        xl5
        offset-sm1
        offset-md0
        offset-xl1
      >
        <h5 class="headline">{{ game.title }}</h5>
      </v-flex>
    </v-layout>

    <v-layout
      row
      wrap
    >
      <v-flex
        sm10
        md6
        lg6
        xl5
        offset-sm1
        offset-md0
        offset-xl1
      >
        <GameInfo
          :game="game"
          @onPlay="$emit('onPlay')"
        />
      </v-flex>
      <v-flex
        sm10
        md6
        lg6
        xl5
        offset-sm1
        offset-md0
      >
        <GameInfoExtra
          :game="game"
          @onReview="$emit('onReview')"
        />
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
  components: {
    GameInfo,
    GameInfoExtra,
  },
  props: {
    game: {
      default: () => {},
      type: Object,
    },
  },
};
</script>

<style>
</style>
