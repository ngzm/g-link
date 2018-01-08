<template>
  <router-view></router-view>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import { mapState, mapGetters, mapActions } from 'vuex';

Vue.use(Vuetify);

export default {
  computed: {
    ...mapState('user', [
      'user',
      'authenticated',
    ]),
    ...mapGetters('errors', [
      'serious',
    ]),
  },
  methods: {
    ...mapActions('user', [
      'authAction',
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
    this.authAction();
  },
};
</script>

<style>
</style>
