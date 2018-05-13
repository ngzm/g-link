<template>
  <section>
    <h2>System Error</h2>
    <p>System error has occured, disable to proceed .. </p>

    <AlertField :alerts="serverErrors" />
  </section>
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
