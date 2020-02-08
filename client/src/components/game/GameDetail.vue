<template>
  <v-container
    fluid
    grid-list-xl
  >
    <v-row
      class="hidden-sm-and-down"
    >
      <v-col
        sm="10"
        md="6"
        lg="6"
        xl="5"
        offset-sm="1"
        offset-md="0"
        offset-xl="1"
      >
        <h5 class="headline">{{ game.title }}</h5>
      </v-col>
    </v-row>

    <v-row>
      <v-col
        sm="10"
        md="6"
        lg="6"
        xl="5"
        offset-sm="1"
        offset-md="0"
        offset-xl="1"
      >
        <GameInfo
          :game="game"
          @onPlay="$emit('onPlay')"
        />
      </v-col>
      <v-col
        sm="10"
        md="6"
        lg="6"
        xl="5"
        offset-sm="1"
        offset-md="0"
      >
        <GameInfoExtra
          :game="game"
          @onReview="$emit('onReview')"
        />
      </v-col>
    </v-row>
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
