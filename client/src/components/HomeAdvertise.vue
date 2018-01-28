<template>
  <v-layout row wrap>
    <v-flex xs12 md6 lg4 xl2 v-for="(ad, index) in displayHome" :key="index">
      <v-card class="grey lighten-2" flat height="152px" >
        <v-card-text>
          <div class="asrc" v-html="ad.src"></div>
          <div>
            <p class="atitle" v-text="ad.title"></p>
            <p v-text="ad.description"></p>
          </div>
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
      'displayHome',
    ]),
  },
  methods: {
    ...mapMutations([
      'arrangeDisplayHome',
    ]),
  },
  created: function() {
    this.arrangeDisplayHome();
  },
};
</script>

<style>
.asrc {
  float: left;
  padding-right: 14px;
}
.atitle {
  color: #666666;
  font-weight: bold;
  padding: 0;
  margin: 0 0 8px 0;
}
</style>
