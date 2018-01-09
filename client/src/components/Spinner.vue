<template>
  <div class="pinwheel" v-show="waitfor">
    <v-progress-circular
      indeterminate
      v-bind:size="70"
      v-bind:width="7"
      class="mt-5 primary--text"
    ></v-progress-circular>
  </div>
</template>

<script>
export default {
  props: {
    waitfor: { type: Boolean },
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
