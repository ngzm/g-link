<template>
  <v-layout row wrap>
    <v-flex xs12 md4>
      <HomeRankingList mode="2" :ranking="stars" />
    </v-flex>
    <v-flex xs12 md4>
      <HomeRankingList mode="3" :ranking="accesses" />
    </v-flex>
    <v-flex xs12 md4>
      <HomeRankingList mode="1" :ranking="updates" />
    </v-flex>
  </v-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import HomeRankingList from './HomeRankingList.vue';
const { mapState } = createNamespacedHelpers('ranking');

export default {
  computed: {
    ...mapState( [
      'updates',
      'stars',
      'accesses',
    ]),
  },
  components: {
    HomeRankingList,
  },
};
</script>

<style>
</style>
