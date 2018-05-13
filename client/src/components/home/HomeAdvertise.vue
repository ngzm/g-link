<template>
  <v-layout
    class="mt-2"
    row
    wrap
  >
    <v-flex
      v-for="(ad, index) in displayHome"
      :key="index"
      xs12
      md6
      lg4
      xl2
    >
      <v-card
        color="grey lighten-2"
        height="152px"
        flat
      >
        <v-card-text>
          <div
            class="asrc"
            v-html="ad.src"
          />
          <div>
            <p
              class="atitle"
              v-text="ad.title"
            />
            <p
              v-text="ad.description"
            />
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
  created: function() {
    this.arrangeDisplayHome();
  },
  methods: {
    ...mapMutations([
      'arrangeDisplayHome',
    ]),
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
