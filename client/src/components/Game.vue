<template>
  <section v-if="isFetching">
    <div class="progress">
      <v-progress-circular
        indeterminate
        v-bind:size="70"
        v-bind:width="7"
        class="mt-5 primary--text"
      ></v-progress-circular>
    </div>
  </section>
  <section v-else>
    <router-view></router-view>
  </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapGetters } = createNamespacedHelpers('games');

/**
 * Game Component
 */
export default {
  computed: {
    ...mapGetters([
      'isFetching',
    ]),
  },
};
</script>

<style>
.progress {
  text-align: center;
}
</style>
