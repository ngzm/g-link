<template>
  <v-list dark>
    <v-subheader>{{ header }}</v-subheader>

    <template v-for="(item, index) in ranking">
      <v-list-tile
        :key="index"
        exact
        :to="`/cview/category/${item.category1}/game/${item.id}`"
      >
        <v-list-tile-action v-if="index === 0">
          <v-icon :class="color_one">looks_one</v-icon>
        </v-list-tile-action>
        <v-list-tile-action v-if="index === 1">
          <v-icon :class="color_two">looks_two</v-icon>
        </v-list-tile-action>
        <v-list-tile-action v-if="index === 2">
          <v-icon :class="color_3">looks_3</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </template>

    <v-list-tile exact to="/cview/ranking">
      <v-list-tile-content>
        <v-list-tile-title>more .....</v-list-tile-title>
      </v-list-tile-content>
    </v-list-tile>

  </v-list>
</template>

<script>
export default {
  props: {
    mode: { type: String },
    ranking: { type: Array },
  },
  computed: {
    header: function() {
      return (this.mode == '1') ? '新着順' :
        (this.mode == '2') ? '評価ランキング' : 'アクセス数ランキング';
    },
    color_one: function() {
      return (this.mode == '1') ? 'blue--text' :
        (this.mode == '2') ? 'deep-orange--text text--darken-1' : 'green--text';
    },
    color_two: function() {
      return (this.mode == '1') ? 'cyan--text' :
        (this.mode == '2') ? 'orange--text text--darken-1' : 'light-green--text';
    },
    color_3: function() {
      return (this.mode == '1') ? 'teal--text text--accent-3' :
        (this.mode == '2') ? 'amber--text text--darken-1' : 'lime--text';
    },
  },
};
</script>

<style>
</style>
