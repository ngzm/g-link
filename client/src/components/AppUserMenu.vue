<template>
  <v-menu bottom left>
    <v-btn
      slot="activator"
      icon
      dark
      v-tooltip:left="{ html: `ようこそ ${user.name} さん` }"
    >
      <v-avatar size="32px" v-if="hasPicture">
        <img :src="user.picture" alt="user.name">
      </v-avatar>
      <v-icon dark v-else>
        account_circle
      </v-icon>
    </v-btn>
    <v-list dense>

      <v-list-tile to="/account">
        <v-list-tile-content>
          <v-list-tile-title>アカウント管理</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>account_box</v-icon>
        </v-list-tile-action>
      </v-list-tile>

      <v-list-tile @click.stop.prevent="$emit('logout')">
        <v-list-tile-content>
          <v-list-tile-title>ログアウト</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>person_outline</v-icon>
        </v-list-tile-action>
      </v-list-tile>

    </v-list>
  </v-menu>
</template>

<script>
export default {
  props: {
    user: Object,
    auth: Boolean,
  },
  computed: {
    hasPicture: function() {
      return !!this.user.picture;
    },
  },
};
</script>

<style>
</style>
