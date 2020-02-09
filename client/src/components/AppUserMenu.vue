<template>
  <v-menu
    bottom
    left
    offset-y
  >
    <template v-slot:activator="{ on }">
      <v-btn
        icon
        dark
        v-on="on"
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
    </template>
    <v-list dense>
      <v-list-item
        to="/cview/account"
      >
        <v-list-item-content>
          <v-list-item-title>アカウント情報</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>account_box</v-icon>
        </v-list-item-action>
      </v-list-item>
      <v-list-item
        @click.stop.prevent="$emit('logout')"
      >
        <v-list-item-content>
          <v-list-item-title>ログアウト</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
          <v-icon>person_outline</v-icon>
        </v-list-item-action>
      </v-list-item>
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
