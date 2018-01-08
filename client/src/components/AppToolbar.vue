<template>
  <!-- Toolbar -->
  <v-toolbar class="indigo" dark fixed>

    <!-- Left Menu -->
    <v-toolbar-title>
      <v-toolbar-side-icon @click.stop="$emit('toggleDrawer')"></v-toolbar-side-icon>
      <a class="main-title" @click.stop.prevent="$router.push('/cview')" href="">webgames.link</a>
    </v-toolbar-title>

    <v-spacer></v-spacer>

    <!-- Right Menu -->
    <v-menu bottom left>
      <v-btn icon slot="activator" dark>
        <v-icon>more_vert</v-icon>
      </v-btn>
      <v-list dense>
        <v-list-tile to="/search">
          <v-list-tile-content>
            <v-list-tile-title>検索</v-list-tile-title>
          </v-list-tile-content>
          <v-list-tile-action>
            <v-icon>search</v-icon>
          </v-list-tile-action>
        </v-list-tile>

        <v-list-tile to="/login">
          <v-list-tile-content>
            <v-list-tile-title>ログイン</v-list-tile-title>
          </v-list-tile-content>
          <v-list-tile-action>
            <v-icon>person_outline</v-icon>
          </v-list-tile-action>
        </v-list-tile>

        <v-list-tile to="/account">
          <v-list-tile-content>
            <v-list-tile-title>アカウント管理</v-list-tile-title>
          </v-list-tile-content>
          <v-list-tile-action>
            <v-icon>account_box</v-icon>
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

      </v-list>
    </v-menu>

  </v-toolbar>
</template>

<script>
</script>

<style>
a.main-title { color: #fff; text-decoration: none; }
a.main-title:link { color: #fff; }
a.main-title:visited { color: #fff; }
a.main-title:hover { color: #fff; }
a.main-title:active { color: #fff; }
</style>
