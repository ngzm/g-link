<template>
  <div
    v-if="spinner"
    class="pinwheel"
  >
    <v-progress-circular
      :size="70"
      :width="7"
      class="mt-5 primary--text"
      indeterminate
    />
  </div>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapState } = createNamespacedHelpers('uiSpinner');

export default {
  computed: {
    ...mapState([
      'spinner',
    ]),
  },
};
</script>

<style>
.pinwheel {
  position: fixed;
  top: 100px;
  left: 50%;
  text-align: center;
}
</style>
