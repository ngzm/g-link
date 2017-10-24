<template>
  <v-dialog width="600" v-model="dopen">
    <v-card>
      <v-card-title>
        <div>
          <h3 class="headline">評価・口コミ登録</h3>
          <div>{{ game.title }} は気に入りましたか？</div>
        </div>
      </v-card-title>
      <v-divider></v-divider>
      <v-card-text>
        <div>
          <h3 class="title">評価</h3>
          <div>ほしほし</div>
        </div>
      </v-card-text>
      <v-card-text>
        <div>
          <h3 class="title">口コミ</h3>
          <div>くちこみ</div>
        </div>
      </v-card-text>
      <v-divider></v-divider>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn dark class="blue" @click.native="rateGame">登録する</v-btn>
        <v-btn dark class="grey" @click.native="closeDialog">やめる</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    dialog: {
      type: Boolean,
    },
    game: {
      type: Object,
    },
  },
  computed: {
    dopen: {
      get: function() {
        return this.dialog;
      },
      set: function(flg) {
        this.$emit('setShowDialog', flg);
      },
    },
  },
  methods: {
    rateGame : function() {
      this.$emit('setShowDialog', false);
    },
    closeDialog: function() {
      this.$emit('setShowDialog', false);
    },
  },
};
</script>

<style>
</style>
