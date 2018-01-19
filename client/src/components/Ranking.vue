<template>
  <section>
    <v-container grid-list-lg>
      <!-- Alerts -->
      <AlertField v-bind:alerts="serverErrors" />

      <h5 class="headline">ランキング</h5>

      <v-layout row wrap>
        <v-flex xs12 sm10 md9 xl7>

          <!-- Ranking -->
          <RankingFrame />

        </v-flex>
        <v-flex class="hidden-sm-and-down" md3 xl2>

          <!-- Side AD -->
          <RankingAdvertise />

        </v-flex>
      </v-layout>
    </v-container>
  </section>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import AlertField from './AlertField.vue';
import RankingFrame from './RankingFrame.vue';
import RankingAdvertise from './RankingAdvertise.vue';

/**
 * Ranking Component
 */
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
      vm.fetchRanking(10);
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.fetchRanking(10);
    next();
  },
  components: {
    AlertField,
    RankingFrame,
    RankingAdvertise,
  },
};
</script>

<style>
</style>
