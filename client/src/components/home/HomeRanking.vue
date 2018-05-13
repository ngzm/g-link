<template>
  <v-layout
    class="mt-2"
    row
    wrap
  >
    <v-flex
      xs12
      md4
    >
      <HomeRankingList
        :ranking="stars"
        mode="2"
      />
    </v-flex>
    <v-flex
      xs12
      md4
    >
      <HomeRankingList
        :ranking="accesses"
        mode="3"
      />
    </v-flex>
    <v-flex
      xs12
      md4
    >
      <HomeRankingList
        :ranking="updates"
        mode="1"
      />
    </v-flex>
  </v-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import HomeRankingList from './HomeRankingList.vue';
const { mapState } = createNamespacedHelpers('ranking');

export default {
  components: {
    HomeRankingList,
  },
  computed: {
    ...mapState( [
      'updates',
      'stars',
      'accesses',
    ]),
  },
};
</script>

<style>
</style>
