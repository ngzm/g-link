<template>
  <v-card>
    <v-card-text>
      <div>
        <h5 class="title">プレイ回数</h5>
        <p class="mt-3 ml-2">{{ game.access }} 回</p>
      </div>
    </v-card-text>

    <v-card-text class="pt-0">
      <div>
        <h5 class="title">総合評価</h5>
        <p class="mt-3 ml-2">
          <span>
            <v-icon
              v-for="n in intStar"
              :key="n"
              color="orange"
            >
              star
            </v-icon>
          </span>
          <span v-if="game.star > 0">({{ formatStar }})</span>
          <span v-else>評価は未だありません</span>
        </p>
      </div>
    </v-card-text>

    <v-card-actions class="pt-0">
      <v-btn
        color="teal darken-2"
        block
        dark
        @click="$emit('onReview')"
      >
        評価する
        <v-icon>star</v-icon>
      </v-btn>
    </v-card-actions>

    <v-card-text class="pt-4">
      <div>
        <h5 class="title">最新口コミ</h5>
        <div
          v-if="game.reviews && game.reviews.length > 0"
          class="mt-3"
        >
          <v-expansion-panel expand>
            <v-expansion-panel-content
              v-for="(rv, index) in game.reviews"
              :key="index"
              value="true"
            >
              <div slot="header">
                {{ rv.user }}
                <span>
                  <v-icon
                    v-for="n in rv.star"
                    :key="n"
                    color="yellow darken-2"
                    class="star"
                  >
                    star
                  </v-icon>
                </span>
              </div>
              <v-card>
                <v-card-text
                  class="grey lighten-3"
                >
                  {{ rv.comment }}
                </v-card-text>
              </v-card>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </div>
        <p
          v-else
          class="mt-3 ml-2"
        >
          口コミは未だありません
        </p>
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
/**
 * Game Detail Information Component
 */
export default {
  props: {
    game: {
      default: () => {},
      type: Object,
    },
  },
  computed: {
    intStar: function() {
      return (this.game.star) ? Math.round(this.game.star) : 0;
    },
    formatStar: function() {
      return (this.game.star) ? this.game.star.toFixed(2) : 0.0;
    },
  },
};
</script>

<style>
.star {
  font-size: 75%;
}
</style>
