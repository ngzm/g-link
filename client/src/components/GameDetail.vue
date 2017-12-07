<template>
  <v-container fluid grid-list-xl>
    <!-- alerts -->
    <AlertField v-bind:alerts="serverErrors" />

    <!-- game information -->
    <v-layout row wrap>
      <v-flex md8 lg7 xl6 offset-md2 offset-lg0>

        <!-- Game image -->
        <div>
          <img :src="game.img" style="width: 100%" />
        </div>

        <!-- Events -->
        <div class="text-xs-right">
          <v-btn
            icon
            fab
            dark
            class="pink"
            v-tooltip:bottom="{ html: 'プレイする' }"
          ><v-icon>play_arrow</v-icon></v-btn>
          <v-btn
            icon
            fab
            dark
            class="orange"
            @click.native.stop="onOpenReview"
            v-tooltip:bottom="{ html: '評価する' }"
          ><v-icon>star</v-icon></v-btn>
          <v-btn
            icon
            fab
            dark
            class="blue"
            @click="$router.back()"
            v-tooltip:bottom="{ html: '一覧に戻る' }"
          ><v-icon>apps</v-icon></v-btn>
        </div>

      </v-flex>
      <v-flex md8 lg5 xl6 offset-md2 offset-lg0>

        <!-- Game information -->
        <GameInfo :game="game" />

      </v-flex>

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

    </v-layout>

    <!-- progress --> 
    <div class="progress" v-if="waiting">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>

  </v-container>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import { dataStatus } from '../stores/StoreStatus';
import GameInfo from './GameInfo.vue';
import GameReview from './GameReview.vue';
import AlertField from './AlertField.vue';
import Infobar from './Infobar.vue';

/**
 * Game Detail Component
 */
export default {
  props: {
    id: { type: String, },
  },
  data() {
    return {
      dialog: false,
      snackbar: false,
      message: '',
    };
  },
  computed: {
    waiting: function() {
      return this.reviewStatus === dataStatus.INTIAL || this.reviewStatus === dataStatus.BUZY;
    },
    readyReview: function() {
      return this.dialog && this.reviewStatus === dataStatus.ACCESSIBLE;
    },
    registeredReview: function() {
      return this.snackbar && this.reviewStatus === dataStatus.REGISTERED;
    },
    ...mapState('game', [
      'game',
    ]),
    ...mapState('greview', [
      'reviewStatus',
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
      this.fetchReview(this.id);
      this.setDialog(true);
    },
    onRegisterReview: function(review) {
      this.setDialog(false);
      this.registerReview(review);
      this.message = `${this.game.title} の評価を登録しました`;
      this.setSnackbar(true);
    },
    ...mapActions('greview', [
      'fetchReview',
      'registerReview',
    ]),
  },
  components: {
    GameInfo,
    GameReview,
    AlertField,
    Infobar,
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
