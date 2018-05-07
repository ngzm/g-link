<template>
  <section>
    <!-- Alerts -->
    <AlertField :alerts="serverErrors" />

    <v-container
      fluid
      grid-list-lg
    >
      <v-layout
        row
        wrap
      >
        <v-flex xs12>
          <h5 class="headline">お問い合わせ</h5>
          <p>工事中です</p>
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
  components: {
    AlertField,
  },
  computed: {
    ...mapState([
      'serverErrors',
    ]),
  },
};
</script>

<style>
</style>
