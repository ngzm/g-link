<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import { mapGetters, mapActions } from 'vuex';

Vue.use(Vuetify);

export default {
  computed: {
    ...mapGetters('errors', [
      'serious',
    ]),
  },
  methods: {
    ...mapActions('user', [
      'authAction',
    ]),
    ...mapActions('advertise', [
      'fetchAdvertise',
    ]),
  },
  watch: {
    serious: function(value) {
      if (value) {
        this.$router.replace('/cerror');
      }
    },
  },
  created: function() {
    // 認証処理
    this.authAction();

    // 広告情報取得
    this.fetchAdvertise(1);
    this.fetchAdvertise(2);
  },
};
</script>

<style>
</style>
