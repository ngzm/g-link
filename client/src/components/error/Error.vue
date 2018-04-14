<template>
  <v-container fluid>
    <h2>System Error</h2>
    <p>System error has occured, disable to proceed .. </p>

    <!-- alerts -->
    <AlertField v-bind:alerts="serverErrors" />
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
  computed: {
    ...mapState(['serverErrors']),
  },
  components: {
    AlertField,
  },
};
</script>

<style>
</style>
