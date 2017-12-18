<template>
  <div class="mt-4" v-if="alerts.length > 0">
    <template v-for="(a, i) in alerts">
      <v-alert :class="alertClass(a)" :icon="alertIcon(a)" value="true" :key="i">
        {{ a.message }} (status: {{ a.status }})
      </v-alert>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    alerts: Array,
  },
  methods: {
    alertClass: function(a) {
      return (a.level === 'warning') ? 'warning' : 'error';
    },
    alertIcon: function(a) {
      return (a.level === 'warning') ? 'warning' : 'error';
    },
  },
};
</script>

<style>
</style>
