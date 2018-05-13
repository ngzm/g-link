<template>
  <div
    v-if="alerts.length > 0"
    class="mt-4"
  >
    <template v-for="(a, i) in alerts">
      <v-alert
        :key="i"
        :class="alertClass(a)"
        :icon="alertIcon(a)"
        value="true"
      >
        {{ a.message }} (status: {{ a.status }})
      </v-alert>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    alerts: {
      default: () => [],
      type: Array,
    }
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
