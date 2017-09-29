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
    <GameList :categoryTitle="category" />
  </section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import GameList from './GameList.vue';

const { mapGetters } = createNamespacedHelpers('games');

/**
 * Game Component
 */
export default {
  props: {
    category: String,
  },
  computed: {
    ...mapGetters([
      'isFetching',
    ]),
  },
  components: {
    GameList,
  },
};
</script>

<style>
.progress {
  text-align: center;
}
</style>
