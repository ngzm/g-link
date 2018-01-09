<template>
  <section>
    <!-- Title -->
    <h5 class="headline mt-3 ml-3 mb-0">{{ category.title }}</h5>

    <!-- Alerts -->
    <AlertField v-bind:alerts="serverErrors" />

    <!-- Games list -->
    <GameList v-bind:games="games" v-on:onSelect="onSelectGame" />

    <!-- Floating action buttons for sorting the games list -->
    <SortFb />

    <!-- Progress when waiting for loading -->
    <div v-show="waiting" class="progress">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>
  </section>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';
import GameList from './GameList.vue';
import AlertField from './AlertField.vue';
import SortFb from './SortFb.vue';

/**
 * Game Component
 */
export default {
  props: {
    cid: { type: String, },
  },
  computed: {
    waiting: function() {
      return this.gamesStatus === dataStatus.BUZY;
    },
    category: function() {
      return this.getCurCategory(parseInt(this.cid, 10));
    },
    ...mapState('games', [
      'games',
      'gamesStatus',
    ]),
    ...mapState('errors', [
      'serverErrors',
    ]),
    ...mapGetters('categories', [
      'getCurCategory',
    ]),
  },
  methods: {
    onSelectGame: function(gid) {
      this.$router.push(`/cview/category/${this.cid}/game/${gid}`);
    },
    ...mapActions('games', [
      'fetchGames',
    ]),
  },
  components: {
    GameList,
    AlertField,
    SortFb,
  },
  beforeRouteEnter (to, from, next) {
    next(vm => {
      vm.fetchGames(to.params.cid);
    });
  },
  beforeRouteUpdate (to, from, next) {
    this.fetchGames(to.params.cid);
    next();
  },
};
</script>

<style>
.progress {
  position: fixed;
  top: 100px;
  left: 50%;
  text-align: center;
}
</style>
