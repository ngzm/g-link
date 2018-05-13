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
export default {
  props: {
    message: {
      required: true,
      type: String,
    },
    snackbar: {
      required: true,
      type: Boolean,
    },
    setSnackbar: {
      required: true,
      type: Function,
    },
  },
  computed: {
    displayme: {
      get: function() {
        return this.snackbar;
      },
      set: function(flg) {
        this.setSnackbar(flg);
      },
    },
  },
  methods: {
    cancel: function() {
      this.setSnackbar(false);
    },
  },
};
</script>

<style>
</style>
