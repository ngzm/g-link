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
      class="red darken-2"
      v-tooltip:left="{ html: `ｿｰﾄ: ${getCurSortKey.title}` }"
      dark
      fab
      hover
      v-model="fab"
    >
      <v-icon>sort</v-icon>
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

/**
 * SortFb (Floating Button) Component
 */
export default {
  data: () => ({
    fab: false,
  }),
  computed: {
    sortKeys: function() {
      return this.getSortKeys.map((k) => {
        const color = (k.id !== this.getCurSortKey.id) ? 'grey darken-1'
          : (k.id === 1) ? 'blue darken-2'
            : (k.id === 2) ? 'amber darken-2'
              : 'green darken-2';
        return { color, ...k };
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
    },
    ...mapMutations([
      'setCurSortKey',
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
