<template>
  <router-view></router-view>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import { mapGetters } from 'vuex';

Vue.use(Vuetify);

export default {
  computed: {
    ...mapGetters('errors', [
      'serious',
    ]),
  },
  watch: {
    serious: function(value) {
      if (value) {
        this.$router.replace('/error');
      }
    },
  },
  created: function() {
    this.$router.push('/');
  },
};
</script>

<style>
</style>
