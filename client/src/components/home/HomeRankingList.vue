<template>
  <v-list dark>
    <v-subheader>{{ header }}</v-subheader>

    <template v-for="(item, index) in ranking">
      <v-list-item
        :key="index"
        :to="`/cview/category/${item.category1}/game/${item.id}`"
        exact
      >
        <v-list-item-action v-if="index === 0">
          <v-icon :color="color_one">
            looks_one
          </v-icon>
        </v-list-item-action>
        <v-list-item-action v-if="index === 1">
          <v-icon :color="color_two">
            looks_two
          </v-icon>
        </v-list-item-action>
        <v-list-item-action v-if="index === 2">
          <v-icon :color="color_3">
            looks_3
          </v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>
            {{ item.title }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </template>

    <v-list-item
      to="/cview/ranking"
      exact
    >
      <v-list-item-content>
        <v-list-item-title>
          more .....
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>

  </v-list>
</template>

<script>
export default {
  props: {
    mode: {
      required: true,
      type: String,
    },
    ranking: {
      required: true,
      type: Array,
    },
  },
  computed: {
    header: function() {
      return (this.mode == '1') ? '新着順' :
        (this.mode == '2') ? '評価ランキング' : 'アクセスランキング';
    },
    color_one: function() {
      return (this.mode == '1') ? 'blue' :
        (this.mode == '2') ? 'deep-orange darken-1' : 'green';
    },
    color_two: function() {
      return (this.mode == '1') ? 'cyan' :
        (this.mode == '2') ? 'orange darken-1' : 'light-green';
    },
    color_3: function() {
      return (this.mode == '1') ? 'teal accent-3' :
        (this.mode == '2') ? 'amber darken-1' : 'lime';
    },
  },
};
</script>

<style>
</style>
