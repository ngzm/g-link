<template>
  <v-container fluid grid-list-xl>

    <v-layout row wrap>
      <v-flex xs6>
        <h3>{{ game.title }}</h3>
      </v-flex>
      <v-flex xs6 class="text-xs-right">
        <v-btn
          icon
          fab
          dark
          class="pink"
          v-tooltip:bottom="{ html: 'Play Game' }">
          <v-icon>play_arrow</v-icon>
        </v-btn>
        <v-btn
          icon
          fab
          dark
          class="teal"
          @click="$router.back()"
          v-tooltip:bottom="{ html: 'Back' }">
          <v-icon>apps</v-icon>
        </v-btn>
      </v-flex>
    </v-layout>

    <v-layout row wrap>
      <!-- game image -->
      <v-flex sm12 md6>
        <img :src="game.iconUri" style="width: 100%" />
      </v-flex>
      <!-- game information -->
      <v-flex sm12 md6>
        <p>{{ game.description }}</p>
      </v-flex>
    </v-layout>

  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapGetters } = createNamespacedHelpers('games');

/**
 * Game Detail Component
 */
export default {
  props: {
    id: {
      type: String,
    },
  },
  computed: {
    game: function() {
      const id = parseInt(this.id, 10);
      return this.getGameById(id);
    },
    ...mapGetters([
      'getGameById',
    ]),
  },
};
</script>

<style>
</style>
