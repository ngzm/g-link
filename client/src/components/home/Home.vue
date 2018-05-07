<template>
  <v-container grid-list-lg>
    <!-- Alerts -->
    <AlertField :alerts="serverErrors" />

    <v-layout
      row
      wrap
    >
      <!-- Logo -->
      <v-flex
        class="mt-4 text-xs-center"
        xs12
      >
        <img
          class="main_logo"
          src="/images/freegame_link_logo1.png"
          alt="freegame.link"
        >
      </v-flex>

      <!-- AD -->
      <v-flex
        class="mt-5"
        xs12
      >
        <h5 class="headline">オススメ</h5>
        <HomeAdvertise />
      </v-flex>

      <!-- Ranking -->
      <v-flex
        class="mt-5"
        xs12
      >
        <h5 class="headline">ランキング</h5>
        <HomeRanking />
      </v-flex>

      <!-- Contents -->
      <v-flex
        class="mt-5"
        xs12
      >
        <h5 class="headline">カテゴリー</h5>
        <HomeNavi />
      </v-flex>

      <!-- About -->
      <v-flex
        class="mt-5"
        xs12
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
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import AlertField from '../util/AlertField.vue';
import HomeAdvertise from './HomeAdvertise.vue';
import HomeRanking from './HomeRanking.vue';
import HomeNavi from './HomeNavi.vue';

export default {
  components: {
    AlertField,
    HomeAdvertise,
    HomeRanking,
    HomeNavi,
  },
  computed: {
    ...mapState('errors', [
      'serverErrors',
    ]),
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
