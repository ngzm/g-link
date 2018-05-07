<template>
  <v-layout
    class="mt-2"
    row
    wrap
  >
    <template v-for="item in categories">
      <v-btn
        :key="item.id"
        :to="`/cview/category/${item.id}`"
        color="blue white--text"
        style="width: 154px;"
      >
        {{ item.title }}
        <v-icon
          right
          dark
        >
          {{ item.icon }}
        </v-icon>
      </v-btn>
    </template>
  </v-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapGetters } = createNamespacedHelpers('categories');

/**
 * Game categories navigation buttons on Main Component
 */
export default {
  computed: {
    ...mapGetters({ categories: 'getCategories' }),
  },
};
</script>

<style>
</style>
