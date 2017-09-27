<template>
<section>
  <v-container grid-list-lg>
    <h3>{{ category }}aa</h3>
    <v-layout row wrap>
      <v-flex xs12 sm6 md4 lg3 xl2 v-for="game in getGames(1)" :key="game.id">
        <v-card class="grey darken-2 white--text" flat>
          <v-card-media :src="game.iconUri" height="200px">
          </v-card-media>
          <v-card-actions>
            <span>{{ game.title }}
            <br>
              <v-icon
                v-for="n in game.star"
                :key="n"
                class="yellow--text" style="font-size:75%"
              >star</v-icon>
            </span>
            <v-spacer></v-spacer>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</section>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';

const { mapGetters, mapActions } = createNamespacedHelpers('games');

export default {
  props: {
    category: String,
  },

  computed: {
    ...mapGetters([
      'getGames',
    ]),
  },

  methods: {
    ...mapActions([
      'fetchGames',
    ]),
  },

  created: function() {
    this.fetchGames(this.category);
  },
};
</script>

<style>
</style>
