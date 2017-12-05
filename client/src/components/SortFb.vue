<template>
  <v-speed-dial
    v-model="fab"
    top
    right
    direction="bottom"
    transition="slide-y-transition"
    class="glist-speed-dial"
  >
    <v-btn
      slot="activator"
      :class="fbcolor"
      v-tooltip:left="{ html: `ｿｰﾄ: ${getCurSortKey.title}` }"
      dark
      fab
      hover
      v-model="fab"
    >
      <v-icon>{{fbicon}}</v-icon>
    </v-btn>
    <v-btn
      v-for="key in sortKeys"
      :key="key.id"
      :class="key.color"
      @click="setSortOrder(key.id)"
      v-tooltip:left="{ html: `${key.title}` }"
      fab
      dark
      small
    >
      <v-icon>{{key.icon}}</v-icon>
    </v-btn>
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
  position: fixed;
  margin-top: 70px;
}
.glist-speed-dial .btn--floating {
  position: relative;
}
</style>
