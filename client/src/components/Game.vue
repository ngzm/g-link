<template>
  <section>
    <div v-if="isBuzy" class="progress">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>
    <div v-else>
      <router-view></router-view>
    </div>
  </section>
</template>

<script>
import { mapState } from 'vuex';
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
    ...mapState('games', ['gamesStatus']),
    ...mapState('game', ['gameStatus']),
  },
};
</script>

<style>
.progress {
  text-align: center;
}
</style>
