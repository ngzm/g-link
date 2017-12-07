<template>
  <v-container fluid>
    <h2>Fatal Error</h2>
    <p>
      A fatal system error has occured. http status: {{ status }} </br>
      Sorry, I can not proceed ..
    </p>

    <div class="mt-2">
      <!-- Errors alert -->
      <v-alert class="error" icon="error" value="true" v-for="(err, index) in errors" :key="index">
        {{ err.message }} (error code: {{ err.code }})
      </v-alert>

    </div>
  </v-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapState } = createNamespacedHelpers('errors');

/**
 * Error Component
 */
export default {
  computed: {
    ...mapState({
      status: 'httpStatus',
      errors: 'serverErrors',
    }),
  },
};
</script>

<style>
</style>
