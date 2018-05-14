<template>
  <v-container>
    <v-layout
      class="mt-2"
      row
      wrap
    >
      <v-flex xs12>
        <h2 class="headline">System Error</h2>
        <p class="mt-3">System error has occured, can not proceed .. </p>
      </v-flex>
      <v-flex xs12>
        <AlertField :alerts="serverErrors" />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import AlertField from '../util/AlertField.vue';
const { mapState } = createNamespacedHelpers('errors');

/**
 * Error Component
 */
export default {
  components: {
    AlertField,
  },
  computed: {
    ...mapState(['serverErrors']),
  },
};
</script>

<style>
</style>
