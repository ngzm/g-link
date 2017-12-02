<template>
  <v-snackbar v-model="displayme" success :timeout="3000" multi-line>
    {{ message }}
    <v-btn dark flat @click.native="cancel">Close</v-btn>
  </v-snackbar>
</template>

<script>
export default {
  props: {
    message: { type: String },
    snackbar: { type: Boolean },
    setSnackbar: { type: Function },
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
