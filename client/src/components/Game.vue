<template>
  <section v-if="isBuzy">
    <div class="progress">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>
  </section>
  <section v-else>
    <router-view></router-view>
  </section>
</template>

<script>
import { mapGetters } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';

/**
 * Game Component
 */
export default {
  computed: {
    isBuzy: function() {
      const gsBuzy = (this.gamesStatus === dataStatus.BUZY);
      const gmBuzy = (this.gameStatus === dataStatus.BUZY);
      return gsBuzy || gmBuzy;
    },
    ...mapGetters('games', {
      gamesStatus: 'getGamesStatus',
    }),
    ...mapGetters('game', {
      gameStatus: 'getGameStatus',
    }),
  },
};
</script>

<style>
.progress {
  text-align: center;
}
</style>
