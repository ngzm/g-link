<template>
  <router-view />
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  computed: {
    ...mapGetters('errors', [
      'serious',
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
  methods: {
    ...mapActions('user', [
      'authAction',
    ]),
    ...mapActions('advertise', [
      'fetchAdvertise',
    ]),
  },
};
</script>

<style>
</style>
