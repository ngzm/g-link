<template>
  <v-container grid-list-lg>
    <v-row
      align-content="center"
    >
      <!-- Logo -->
      <v-col
        class="mt-4 text-center"
        cols="12"
      >
        <img
          class="main_logo"
          src="/images/freegame_link_logo1.png"
          alt="freegame.link"
        >
      </v-col>

      <!-- AD -->
      <v-col
        class="mt-5"
        cols="12"
      >
        <h5 class="headline">オススメ</h5>
        <HomeAdvertise />
      </v-col>

      <!-- Ranking -->
      <v-col
        class="mt-5"
        cols="12"
      >
        <h5 class="headline">ランキング</h5>
        <HomeRanking />
      </v-col>

      <!-- Contents -->
      <v-col
        class="mt-5"
        cols="12"
      >
        <h5 class="headline">カテゴリー</h5>
        <HomeNavi />
      </v-col>

      <!-- About -->
      <v-col
        class="mt-5"
        cols="12"
      >
        <h5 class="headline">サイト情報</h5>
        <p class="mt-3">
          当サイトについて
          <a
            href="/appl/information/privacy/"
            target="_blank"
          >
            プライバシーポリシ
          </a>
        </p>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapActions } from 'vuex';
import HomeAdvertise from './HomeAdvertise.vue';
import HomeRanking from './HomeRanking.vue';
import HomeNavi from './HomeNavi.vue';

export default {
  components: {
    HomeAdvertise,
    HomeRanking,
    HomeNavi,
  },
  methods: {
    ...mapActions('ranking', [
      'fetchRanking',
    ]),
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.fetchRanking(3);
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.fetchRanking(3);
    next();
  },
};
</script>

<style>
img.main_logo {
  max-width: 100%;
}
</style>
