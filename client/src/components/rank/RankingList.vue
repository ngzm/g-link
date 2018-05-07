<template>
  <v-data-table
    :headers="headers"
    :items="items"
    class="elevation-1 mt-3"
    dark
    hide-actions
  >
    <template
      slot="items"
      slot-scope="props"
    >
      <tr @click="onSelect(props.item.cid, props.item.id)">
        <td class="text-xs-right">{{ props.index + 1 }}</td>
        <td class="no_wrap">{{ props.item.title }}</td>
        <td class="text-xs-right no_wrap">{{ props.item.value }}</td>
      </tr>
    </template>
  </v-data-table>
</template>

<script>
export default {
  props: {
    headers: {
      required: true,
      type: Array,
    },
    items: {
      required: true,
      type: Array,
    },
  },
  methods: {
    onSelect: function(cid, gid) {
      this.$router.push(`/cview/category/${cid}/game/${gid}`);
    },
  },
};
</script>

<style>
.no_wrap {
  white-space: nowrap;
}
</style>
