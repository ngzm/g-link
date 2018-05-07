<template>
  <v-menu
    bottom
    left
    offset-y
  >
    <v-btn
      slot="activator"
      icon
      dark
    >
      <v-icon>more_vert</v-icon>
    </v-btn>
    <v-list dense>
      <v-list-tile
        v-if="!auth"
        @click.stop.prevent="$emit('login')"
      >
        <v-list-tile-content>
          <v-list-tile-title>ログイン</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>person</v-icon>
        </v-list-tile-action>
      </v-list-tile>
      <v-list-tile
        to="/cview/information"
      >
        <v-list-tile-content>
          <v-list-tile-title>サイト情報</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>info_outline</v-icon>
        </v-list-tile-action>
      </v-list-tile>
      <v-list-tile
        @click.stop.prevent="$emit('privacy')"
      >
        <v-list-tile-content>
          <v-list-tile-title>プライバシーポリシ</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>local_parking</v-icon>
        </v-list-tile-action>
      </v-list-tile>
      <v-list-tile
        to="/cview/contact"
      >
        <v-list-tile-content>
          <v-list-tile-title>お問い合わせ</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>contacts</v-icon>
        </v-list-tile-action>
      </v-list-tile>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  props: {
    auth: {
      required: true,
      type: Boolean,
    },
  },
};
</script>

<style>
</style>
