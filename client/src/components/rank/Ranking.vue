<template>
  <section>
    <v-container grid-list-lg>
      <v-layout
        row
        wrap
      >
        <v-flex
          xs12
          sm10
          md9
          xl7
        >
          <RankingFrame />
        </v-flex>
        <v-flex
          class="hidden-sm-and-down"
          md3
          xl2
        >
          <RankingAdvertise />
        </v-flex>
      </v-layout>
    </v-container>
  </section>
</template>

<script>
import { mapActions } from 'vuex';
import RankingFrame from './RankingFrame.vue';
import RankingAdvertise from './RankingAdvertise.vue';

/**
 * Ranking Component
 */
export default {
  components: {
    RankingFrame,
    RankingAdvertise,
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
};
</script>

<style>
</style>
