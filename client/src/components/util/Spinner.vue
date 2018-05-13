<template>
  <div
    v-show="waitfor"
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
export default {
  props: {
    waitfor: {
      required: true,
      type: Boolean,
    },
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
