<template>
  <div class="mt-4" v-if="alerts.length > 0">
    <template v-for="(a, i) in alerts">
      <v-alert class="warning" icon="warning" value="true" :key="i">
        {{ a.message }} (error code: {{ a.code }})
      </v-alert>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    alerts: Array,
  },
};
</script>

<style>
</style>
