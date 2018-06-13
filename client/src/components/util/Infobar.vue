<template>
  <v-snackbar
    v-model="displayme"
    :timeout="2000"
    color="success"
    multi-line
  >
    {{ message }}
    <v-btn
      dark
      flat
      class="hidden-xs-only"
      @click.native="cancel"
    >
      Close
    </v-btn>
  </v-snackbar>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapActions } = createNamespacedHelpers('uiInfobar');

export default {
  computed: {
    displayme: {
      get: function() {
        return this.infobar;
      },
      set: function(flg) {
        this.modInfobar(flg);
      },
    },
    ...mapState([
      'infobar',
      'message',
    ]),
  },
  methods: {
    cancel: function() {
      this.modInfobar(false);
    },
    ...mapActions([
      'modInfobar',
    ]),
  },
};
</script>

<style>
</style>
