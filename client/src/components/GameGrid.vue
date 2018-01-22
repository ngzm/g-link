<template>
  <v-card class="grey darken-2 white--text" flat>
    <v-card-media v-bind:src="game.img" height="200px">
      <a class="g-grid" href="" @click.stop.prevent="$emit('onSelect')"></a>
    </v-card-media>
    <v-card-text class="g-info-container">
      <div class="left">
        <p class="gtitle">{{ game.title }}</p>
      </div>
      <div class="right">
        <v-icon v-for="n in intStar" :key="n" class="yellow--text star" >
          star
        </v-icon>
        <span class="gaccess">{{ game.access }}</span>
      </div>
    </v-card-text>
    <div :class="classGtype">{{ labelGtype }}</div>
  </v-card>
</template>

<script>
/**
 * GameGrid Component
 */
export default {
  props: {
    game: Object,
  },
  computed: {
    intStar: function() {
      return (this.game.star) ? Math.round(this.game.star) : 0;
    },
    labelGtype: function() {
      return (this.game.gtype === 1) ? 'HTML5' : (this.game.gtype === 2) ? 'FLASH' : 'ETC';
    },
    classGtype: function() {
      return (this.game.gtype === 1) ? 'g-type g-blue' : (this.game.gtype === 2) ? 'g-type g-red' : 'g-type';
    },
  },
};
</script>

<style>
a.g-grid {
  display: block;
  width: 100%;
  padding: 4px;
}

.g-info-container {
  display: flex;
}
.g-info-container > .left {
  width: 50%;
}
.g-info-container > .right {
  width: 50%;
  text-align: right;
}
.gtitle {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  padding: 0;
  margin: 0;
}
.gaccess {
  margin-left: 1px;
  font-size: 75%;
  color: orange;
}
.star {
  font-size: 75%;
}

.g-type {
  position: relative;
  top: -240px;
  left: 8px;
  float: left;
  padding: 4px;
  background-color: rgba(10, 10, 10, 0.25);
  font-size: 75%;
}
.g-red {
  background-color: rgba(90, 0, 0, 0.25);
}
.g-blue {
  background-color: rgba(0, 0, 90, 0.25);
}
</style>
