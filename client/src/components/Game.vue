<template>
  <section>
    <!-- Alerts -->
    <AlertField :alerts="serverErrors" />

    <!-- game information -->
    <GameDetail
      :game="game"
      @onReview="onOpenReview"
      @onGoBack="onGoBackList"
    />

    <!-- Game navigation commands -->
    <GameNav
      @onReview="onOpenReview"
      @onGoBack="onGoBackList"
    />

    <!-- Dialog which register game rating --> 
    <GameReview
      :dialog="readyReview"
      :setDialog="setDialog"
      :title="game.title"
      @onRegister="onRegisterReview"
    />

    <!-- Information bar at registered review --> 
    <Infobar
      :snackbar="registeredReview"
      :setSnackbar="setSnackbar"
      :message="message"
    />

    <!-- Progress Bar -->
    <Spinner :waitfor="waiting" />
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';
import GameDetail from './GameDetail.vue';
import GameReview from './GameReview.vue';
import GameNav from './GameNav.vue';
import AlertField from './AlertField.vue';
import Infobar from './Infobar.vue';
import Spinner from './Spinner.vue';

/**
 * Game Detail Component
 */
export default {
  props: {
    cid: { type: String, },
    gid: { type: String, },
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
    ...mapState('errors', [
      'serverErrors',
    ]),
  },
  methods: {
    setDialog: function(flg) {
      this.dialog = flg;
    },
    setSnackbar: function(flg) {
      this.snackbar = flg;
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
  components: {
    AlertField,
    Spinner,
    GameDetail,
    GameReview,
    GameNav,
    Infobar,
  },
};
</script>

<style>
</style>
