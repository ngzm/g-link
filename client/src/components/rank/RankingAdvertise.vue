<template>
  <v-layout
    row
    wrap
  >
    <v-flex xs12>
      <h5 class="title mt-4">オススメ</h5>
    </v-flex>
    <v-flex
      v-for="(ad, index) in displayRank"
      :key="index"
      xs12
    >
      <v-card
        color="grey lighten-2"
        flat
      >
        <v-card-text
          class="text-xs-center"
        >
          <p
            class="atitle"
            v-text="ad.title"
          />
          <div v-html="ad.src" />
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
  created: function() {
    this.arrangeDisplayRank();
  },
  methods: {
    ...mapMutations([
      'arrangeDisplayRank',
    ]),
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
