<template>
  <div>
    <router-view></router-view>
    <Infobar
      :snackbar="snackbar"
      :setSnackbar="setSnackbar"
      :message="message"
    />
  </div>
</template>

<script>
import Vue from 'vue';
import Vuetify from 'vuetify';
import { mapState, mapGetters, mapActions } from 'vuex';
import Infobar from './Infobar.vue';

Vue.use(Vuetify);

export default {
  data() {
    return {
      snackbar: false,
      message: '',
    };
  },
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
    setSnackbar: function(flg) {
      this.snackbar = flg;
    },
    ...mapActions('user', [
      'authAction',
    ]),
  },
  watch: {
    authenticated: function(value) {
      if (value) {
        this.message = `ようこそ ${this.user.name} さん`;
      } else {
        this.message = 'ログアウトしました';
      }
      this.snackbar = true;
    },
    serious: function(value) {
      if (value) {
        this.$router.replace('/cerror');
      }
    },
  },
  created: function() {
    this.authAction();
  },
  components: {
    Infobar,
  },
};
</script>

<style>
</style>
