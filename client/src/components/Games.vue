<template>
  <section>
    <!-- Alerts -->
    <AlertField v-bind:alerts="serverErrors" />

    <!-- Games list -->
    <GameList :title="ctitle" :games="games" @onSelect="onSelectGame" />

    <!-- Floating action buttons for sorting the games list -->
    <SortFb />

    <!-- Progress Bar -->
    <Spinner v-bind:waitfor="waiting" />
  </section>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';
import GameList from './GameList.vue';
import AlertField from './AlertField.vue';
import SortFb from './SortFb.vue';
import Spinner from './Spinner.vue';

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
    ctitle: function() {
      const category = this.getCurCategory(parseInt(this.cid, 10));
      return category ? category.title : 'No Title';
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
    Spinner,
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
</style>
