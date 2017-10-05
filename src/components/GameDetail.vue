<template>
  <v-container fluid grid-list-xl>
    <v-layout row wrap>

      <!-- Left or up flexbox -->
      <v-flex md8 lg7 xl6 offset-md2 offset-lg0>
        <!-- Game image -->
        <div>
          <img :src="game.iconUri" style="width: 100%" />
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
            @click.native.stop="dialog = true"
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
      <GameRating :game="game" :dialog="dialog" @setShowDialog="setShowDialog" />

    </v-layout>
  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import GameInfo from './GameInfo.vue';
import GameRating from './GameRating.vue';

const { mapGetters } = createNamespacedHelpers('games');

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
    };
  },
  computed: {
    game: function() {
      const id = parseInt(this.id, 10);
      return this.getGameById(id);
    },
    ...mapGetters([
      'getGameById',
    ]),
  },
  methods: {
    setShowDialog: function(flg) {
      this.dialog = flg;
    },
  },
  components: {
    GameInfo,
    GameRating,
  },
};
</script>

<style>
</style>
