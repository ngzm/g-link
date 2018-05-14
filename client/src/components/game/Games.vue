<template>
  <section>
    <!-- Games grid tile -->
    <GameList
      v-show="!waiting"
      :title="ctitle"
      :games="games"
      @onSelect="onSelectGame"
    />

    <!-- Floating action buttons for sorting the games list -->
    <SortFb />

    <!-- Progress Bar -->
    <Spinner :waitfor="waiting" />
  </section>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex';
import { dataStatus } from '../../stores/StoreStatus';
import GameList from './GameList.vue';
import SortFb from './SortFb.vue';
import Spinner from '../util/Spinner.vue';

/**
 * Game Component
 */
export default {
  components: {
    GameList,
    SortFb,
    Spinner,
  },
  props: {
    cid: {
      required: true,
      type: String,
    },
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
