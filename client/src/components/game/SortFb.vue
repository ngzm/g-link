<template>
  <v-speed-dial
    v-model="fab"
    fixed
    top
    right
    direction="bottom"
    transition="slide-y-transition"
    class="glist-speed-dial"
  >
    <template v-slot:activator>
      <v-btn
        v-model="fab"
        :color="fbcolor"
        dark
        fab
        hover
      >
        <v-icon>{{ fbicon }}</v-icon>
      </v-btn>
    </template>
    <v-tooltip
      v-for="key in sortKeys"
      :key="key.id"
      left
    >
      <template v-slot:activator="{ on }">
        <v-btn
          :color="key.color"
          fab
          dark
          small
          v-on="on"
          @click="setSortOrder(key.id)"
        >
          <v-icon>{{ key.icon }}</v-icon>
        </v-btn>
      </template>
      <span>{{ key.title }}</span>
    </v-tooltip>
  </v-speed-dial>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapGetters, mapMutations } = createNamespacedHelpers('categories');
const { mapActions } = createNamespacedHelpers('games');

const getButtonColor = k => (
  (k === 1) ? 'blue' : (k === 2) ? 'yellow darken-2' : 'pink'
);

/**
 * SortFb (Floating Button) Component
 */
export default {
  data: () => ({
    fab: false,
  }),
  computed: {
    fbcolor : function() {
      return getButtonColor(this.getCurSortKey.id);
    },
    fbicon : function() {
      return this.getCurSortKey.icon;
    },
    sortKeys: function() {
      return this.getSortKeys.map((k) => {
        return { color: getButtonColor(k.id), ...k };
      });
    },
    ...mapGetters([
      'getSortKeys',
      'getCurSortKey',
    ]),
  },
  methods: {
    setSortOrder: function(key) {
      this.setCurSortKey(key);
      this.sortGames();
    },
    ...mapMutations([
      'setCurSortKey',
    ]),
    ...mapActions([
      'sortGames',
    ]),
  },
};
</script>

<style>
.glist-speed-dial {
  margin-top: 70px;
}
.glist-speed-dial .btn--floating {
  position: relative;
}
</style>
