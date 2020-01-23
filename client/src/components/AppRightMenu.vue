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
      <v-list-item
        v-if="!auth"
        @click.stop.prevent="$emit('login')"
      >
        <v-list-item-content>
          <v-list-item-title>ログイン</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>person</v-icon>
        </v-list-item-action>
      </v-list-item>
      <v-list-item
        to="/cview/information"
      >
        <v-list-item-content>
          <v-list-item-title>サイト情報</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>info_outline</v-icon>
        </v-list-item-action>
      </v-list-item>
      <v-list-item
        @click.stop.prevent="$emit('privacy')"
      >
        <v-list-item-content>
          <v-list-item-title>プライバシーポリシ</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>local_parking</v-icon>
        </v-list-item-action>
      </v-list-item>
      <v-list-item
        to="/cview/contact"
      >
        <v-list-item-content>
          <v-list-item-title>お問い合わせ</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>contacts</v-icon>
        </v-list-item-action>
      </v-list-item>
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
