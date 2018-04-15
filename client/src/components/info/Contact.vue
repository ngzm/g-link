<template>
  <section>
    <v-container fluid grid-list-lg>
      <!-- Alerts -->
      <AlertField v-bind:alerts="serverErrors" />

      <v-layout row wrap>
        <v-flex xs12>
          <h5 class="headline">お問い合わせ</h5>

          工事中です
        </v-flex>
      </v-layout>

    </v-container>
  </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import AlertField from '../util/AlertField.vue';
const { mapState } = createNamespacedHelpers('errors');

export default {
  computed: {
    ...mapState([
      'serverErrors',
    ]),
  },
  components: {
    AlertField,
  },
};
</script>

<style>
</style>
