<template>
  <v-card>
    <v-card-media :src="game.img" height="340px">
      <a class="g-img" href="" @click.stop.prevent="$emit('onPlay')"></a>
    </v-card-media>

    <v-card-actions>
      <v-btn block dark class="red darken-4" @click="$emit('onPlay')" >
        やってみる
        <v-icon>play_arrow</v-icon>
      </v-btn>
    </v-card-actions>

    <v-card-title primary-title>
      <div>
        <h5 class="title">{{ game.title }}</h5>
        {{ game.description }}
      </div>
    </v-card-title>

    <v-card-text>
      <div>
        <h5 class="title">遊び方</h5>
        <ol>
          <li v-for="(is, index) in game.instructions" :key="index">
            {{ is.explanation }}
          </li>
        </ol>
      </div>
    </v-card-text>

    <v-card-text>
      <div>
        <h5 class="title">タイプ</h5>
        <v-avatar tile size="30px" class="ml-1">
          <img :src="logoGtype" alt="gtype logo" />
        </v-avatar>
        {{ labelGtype }}
      </div>
    </v-card-text>

  </v-card>
</template>

<script>
/**
 * Game Information Component
 */
export default {
  props: {
    game: {
      type: Object,
    },
  },
  computed: {
    labelGtype: function() {
      return (this.game.gtype === 1) ? 'HTML5' : (this.game.gtype === 2) ? 'FLASH' : 'ETC';
    },
    logoGtype: function() {
      return (this.game.gtype === 1) ? '/images/html5-logo.png' :
        (this.game.gtype === 2) ? '/images/flash-logo.png' : '/images/etc-logo.png';
    },
  },
};
</script>

<style>
a.g-img {
  display: block;
  width: 100%;
}
</style>
