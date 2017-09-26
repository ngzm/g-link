<template>
<v-app toolbar>

  <!-- Drawer -->
  <v-navigation-drawer
    class="pb-0"
    persistent
    height="100%"
    light
    clipped
    enable-resize-watcher
    v-model="drawer"
  >
    <v-list>
      <template v-for="item in listItems">
        <v-list-tile exact :key="item.id" :to="item.to">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>
  </v-navigation-drawer>

  <!-- Toolbar -->
  <v-toolbar class="indigo" dark fixed>
    <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
    <v-toolbar-title>Toolbar</v-toolbar-title>
  </v-toolbar>

  <!-- Main Contents -->
  <main>
    <v-container fluid>
      <v-layout row wrap>
        Hello !!!
      </v-layout>
    </v-container>
  </main>

</v-app>
</template>

<script>
export default {
  data() {
    return {
      drawer: true,
      listItems: [
        { id: 1, title: 'Home', icon: 'home', to: 'home' },
        { id: 4, title: 'Play Lists', icon: 'featured_play_list', to: 'home' },
      ],
    };
  },
};
</script>

<style>
</style>
