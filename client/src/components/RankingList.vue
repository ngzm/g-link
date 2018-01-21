<template>
  <v-data-table dark :headers="headers" :items="items" hide-actions class="elevation-1">
    <template slot="items" scope="props">
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
    headers: { type: Array },
    items: { type: Array },
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
