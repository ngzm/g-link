<template>
  <v-menu bottom left>
    <v-btn icon slot="activator" dark>
      <v-icon>more_vert</v-icon>
    </v-btn>
    <v-list dense>

      <v-list-tile @click.stop.prevent="$emit('login')" v-if="!auth">
        <v-list-tile-content>
          <v-list-tile-title>ログイン</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>person_outline</v-icon>
        </v-list-tile-action>
      </v-list-tile>

      <v-list-tile to="/info">
        <v-list-tile-content>
          <v-list-tile-title>サイト情報</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>info</v-icon>
        </v-list-tile-action>
      </v-list-tile>

      <v-list-tile to="/info">
        <v-list-tile-content>
          <v-list-tile-title>お問い合わせ</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>info</v-icon>
        </v-list-tile-action>
      </v-list-tile>

    </v-list>
  </v-menu>
</template>

<script>
export default {
  props: {
    auth: Boolean,
  },
};
</script>

<style>
</style>
