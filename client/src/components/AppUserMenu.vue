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
      <v-avatar
        v-if="hasPicture"
        size="32px"
      >
        <img
          :src="user.picture"
          alt="user.name"
        >
      </v-avatar>
      <v-icon
        v-else
        dark
      >
        account_circle
      </v-icon>
    </v-btn>
    <v-list dense>
      <v-list-tile
        to="/cview/account"
      >
        <v-list-tile-content>
          <v-list-tile-title>アカウント情報</v-list-tile-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-icon>account_box</v-icon>
        </v-list-tile-action>
      </v-list-tile>
      <v-list-tile
        @click.stop.prevent="$emit('logout')"
      >
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
    user: {
      default: () => {},
      type: Object,
    },
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
