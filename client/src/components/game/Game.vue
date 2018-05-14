<template>
  <section>
    <!-- game information -->
    <GameDetail
      v-if="!waiting"
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

    <!-- Information bar at registered review --> 
    <Infobar
      :snackbar="registeredReview"
      :set-snackbar="setSnackbar"
      :message="message"
    />

    <!-- Progress Bar -->
    <Spinner :waitfor="waiting" />
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import { dataStatus } from '../../stores/StoreStatus';
import GameDetail from './GameDetail.vue';
import GameReview from './GameReview.vue';
import GameNav from './GameNav.vue';
import Infobar from '../util/Infobar.vue';
import Spinner from '../util/Spinner.vue';

/**
 * Game Detail Component
 */
export default {
  components: {
    Spinner,
    GameDetail,
    GameReview,
    GameNav,
    Infobar,
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
      snackbar: false,
      message: '',
    };
  },
  computed: {
    waiting: function() {
      return this.gameStatus === dataStatus.BUZY ||
             this.reviewStatus === dataStatus.BUZY;
    },
    readyReview: function() {
      return this.dialog && this.reviewStatus === dataStatus.ACCESSIBLE;
    },
    registeredReview: function() {
      return this.snackbar && this.reviewStatus === dataStatus.REGISTERED;
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
    setSnackbar: function(flg) {
      this.snackbar = flg;
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
      this.message = `${this.game.title} の評価を登録しました`;
      this.setSnackbar(true);
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
