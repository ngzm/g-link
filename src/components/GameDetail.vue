<template>
  <!-- Game Detail Information Dialog -->
  <v-dialog v-model="dialog" width="90%">
    <v-card>
      <!-- game title -->
      <v-card-title class="headline">{{ game.title }}</v-card-title>

      <!-- information grid -->
      <v-card-text>
        <v-container fluid grid-list-xl>
          <v-layout row wrap>

            <!-- game igame -->
            <v-flex sm12 md6>
              <img :src="game.iconUri" style="width: 100%" />
            </v-flex>

            <!-- game information -->
            <v-flex sm12 md6>
              <p>{{ game.description }}</p>
            </v-flex>

          </v-layout>
        </v-container>
      </v-card-text>

      <!-- actions -->
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          class="white--text red darken-2"
          dark
          flat="flat"
          @click.native="closeDialog"
        >Play Game</v-btn>
        <v-btn
          class="white--text teal darken-2"
          dark
          flat="flat"
          @click.native="closeDialog"
        >Close</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
/**
 * Game Detail Component
 */
export default {
  props: {
    game: {
      type: Object,
    },
    dopen: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    dialog: {
      get: function () {
        return this.dopen;
      },
      set: function () {
        this.$emit('unshowDetail');
      },
    },
  },

  methods: {
    closeDialog: function() {
      this.$emit('unshowDetail');
    },
  },
};
</script>

<style>
</style>
