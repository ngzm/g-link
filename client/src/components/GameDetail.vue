<template>
  <v-container fluid grid-list-xl>
    <v-layout row wrap>

      <!-- Left or up flexbox -->
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
            class="blue"
            @click.native.stop="onReview"
            v-tooltip:bottom="{ html: '評価する' }"
          ><v-icon>star</v-icon></v-btn>
          <v-btn
            icon
            fab
            dark
            class="amber darken-1"
            @click="$router.back()"
            v-tooltip:bottom="{ html: '一覧に戻る' }"
          ><v-icon>apps</v-icon></v-btn>
        </div>
      </v-flex>

      <!-- Right or down flexbox -->
      <v-flex md8 lg5 xl6 offset-md2 offset-lg0>
        <!-- Game information -->
        <GameInfo :game="game" />
      </v-flex>

      <!-- Dialog which register game rating --> 
      <GameReview
        :dialog="dialog"
        :setDialog="setDialog"
        :title="game.title"
        @onRegister="onRegisterReview"
      />

      <!-- Information bar at registered review --> 
      <Infobar :snackbar="snackbar" :setSnackbar="setSnackbar" :message="message" />

    </v-layout>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import GameInfo from './GameInfo.vue';
import GameReview from './GameReview.vue';
import Infobar from './Infobar.vue';

/**
 * Game Detail Component
 */
export default {
  props: {
    id: {
      type: String,
    },
  },
  data() {
    return {
      dialog: false,
      snackbar: false,
      message: '',
    };
  },
  computed: {
    ...mapGetters('game', {
      game: 'getGame',
    }),
  },
  methods: {
    setDialog: function(flg) {
      this.dialog = flg;
    },
    setSnackbar: function(flg) {
      this.snackbar = flg;
    },
    onReview: function() {
      this.fetchReview(this.id);
      this.setDialog(true);
    },
    onRegisterReview: function(review) {
      this.setDialog(false);
      this.registerReview(review);

      // display registered message
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
    Infobar,
  },
};
</script>

<style>
</style>
