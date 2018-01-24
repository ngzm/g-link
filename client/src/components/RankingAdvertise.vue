<template>
  <v-layout row wrap>
    <h5 class="title">オススメ</h5>

    <v-flex xs12 v-for="(ad, index) in displayRank" :key="index">
      <v-card class="grey lighten-2" flat>
        <v-card-text class="text-xs-center">
          <p class="atitle" v-text="ad.title"></p>
          <div v-html="ad.src"></div>
        </v-card-text>
      </v-card>
    </v-flex>

  </v-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapMutations } = createNamespacedHelpers('advertise');

/**
 * Advertise list on Home Component
 */
export default {
  computed: {
    ...mapState([
      'displayRank',
    ]),
  },
  methods: {
    ...mapMutations([
      'arrangeDisplayRank',
    ]),
  },
  created: function() {
    this.arrangeDisplayRank();
  },
};
</script>

<style>
.atitle {
  color: #666666;
  font-weight: bold;
  padding: 0;
  margin: 0 0 8px 0;
}
</style>
