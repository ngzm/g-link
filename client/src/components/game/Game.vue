<template>
  <section>
    <!-- game information -->
    <GameDetail
      v-if="readyShow"
      :game="game"
      @onPlay="onPlayGame"
      @onReview="onOpenReview"
      @onGoBack="onGoBackList"
    />

    <!-- Game navigation commands -->
    <GameNav
      @onPlay="onPlayGame"
      @onReview="onOpenReview"
      @onGoBack="onGoBackList"
    />

    <!-- Dialog which register game rating --> 
    <GameReview
      :dialog="readyReview"
      :set-dialog="setDialog"
      :title="game.title"
      @onRegister="onRegisterReview"
    />
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import { dataStatus } from '../../stores/StoreStatus';
import GameDetail from './GameDetail.vue';
import GameReview from './GameReview.vue';
import GameNav from './GameNav.vue';

/**
 * Game Detail Component
 */
export default {
  components: {
    GameDetail,
    GameReview,
    GameNav,
  },
  props: {
    cid: {
      required: true,
      type: String,
    },
    gid: {
      required: true,
      type: String,
    },
  },
  data() {
    return {
      direct: false,
      dialog: false,
    };
  },
  computed: {
    readyShow: function() {
      return this.gameStatus === dataStatus.ACCESSIBLE;
    },
    readyReview: function() {
      return this.dialog && this.reviewStatus === dataStatus.ACCESSIBLE;
    },
    ...mapState('greview', [
      'reviewStatus',
    ]),
    ...mapState('game', [
      'game',
      'gameStatus',
    ]),
  },
  methods: {
    setDialog: function(flg) {
      this.dialog = flg;
    },
    onPlayGame: function() {
      this.upAccess(this.gid);
      window.open(this.game.url, '_blank');
    },
    onOpenReview: function() {
      this.fetchReview(this.gid);
      this.setDialog(true);
    },
    onRegisterReview: function(review) {
      this.setDialog(false);
      this.registerReview(review);
    },
    setDirect: function(fp) {
      // A value of from.fulPath is always '/' when load this content directly
      this.direct = (fp == '/') ? true : false;
    },
    onGoBackList: function() {
      if (this.direct) {
        this.$router.push(`/cview/category/${this.cid}`);
      } else {
        this.$router.go(-1);
      }
    },
    ...mapActions('game', [
      'fetchGame',
      'upAccess',
    ]),
    ...mapActions('greview', [
      'fetchReview',
      'registerReview',
    ]),
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.setDirect(from.fullPath);
      vm.fetchGame(to.params.gid);
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.fetchGame(to.params.gid);
    next();
  },
};
</script>

<style>
</style>
