<template>
  <section>
    <!-- Alerts -->
    <AlertField v-bind:alerts="serverErrors" />

    <!-- game information -->
    <GameDetail v-bind:game="game" v-on:onGoBackList="onGoBackList" />

    <!-- Progress Bar -->
    <PinWheel v-bind:waitfor="waiting" />
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';
import GameDetail from './GameDetail.vue';
import AlertField from './AlertField.vue';
import PinWheel from './PinWheel.vue';

/**
 * Game Detail Component
 */
export default {
  props: {
    cid: { type: String, },
    gid: { type: String, },
  },
  computed: {
    waiting: function() {
      return this.gameStatus === dataStatus.BUZY;
    },
    ...mapState('game', [
      'game',
      'gameStatus',
    ]),
    ...mapState('errors', [
      'serverErrors',
    ]),
  },
  methods: {
    onGoBackList: function() {
      this.$router.push(`/cview/category/${this.cid}`);
    },
    ...mapActions('game', [
      'fetchGame',
    ]),
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.fetchGame(to.params.gid);
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.fetchGame(to.params.gid);
    next();
  },
  components: {
    GameDetail,
    AlertField,
    PinWheel,
  },
};
</script>

<style>
</style>
