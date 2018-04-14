<template>
  <section>
    <v-container grid-list-lg>
      <!-- Alerts -->
      <AlertField v-bind:alerts="serverErrors" />

      <!-- Logo -->
      <div class="main_logo">
        <img src="/images/freegame_link_logo1.png" alt="freegame.link" />
      </div>

      <!-- AD -->
      <div>
        <h5 class="headline">オススメ</h5>
        <HomeAdvertise />
      </div>

      <!-- Ranking -->
      <div class="mt-5">
        <h5 class="headline">ランキング</h5>
        <HomeRanking />
      </div>

      <!-- Contents -->
      <div class="mt-5">
        <h5 class="headline">カテゴリー</h5>
        <HomeNavi />
      </div>

      <div class="mt-5">
        <h5 class="headline">サイト情報</h5>
        <p>
          当サイトについて
          <a href="/appl/information/privacy/" target="_blank">
            プライバシーポリシ
          </a>
        </p>
      </div>
    </v-container>
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import AlertField from '../util/AlertField.vue';
import HomeAdvertise from './HomeAdvertise.vue';
import HomeRanking from './HomeRanking.vue';
import HomeNavi from './HomeNavi.vue';

export default {
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
  components: {
    AlertField,
    HomeAdvertise,
    HomeRanking,
    HomeNavi,
  },
};
</script>

<style>
.main_logo {
  padding: 18px;
  text-align: center;
}
.main_logo img {
  max-width: 100%;
}
</style>
